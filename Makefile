NAME=aufs-tools-boot
VERSION=0.1.0
DIR=$(NAME)-$(VERSION)

PREFIX=/

.PHONY: default
default: deb
package: deb

.PHONY: clean
clean:
	rm -fr $(NAME)-* || true
	rm -f $(NAME)_*.deb

$(DIR):
	mkdir "$(DIR)"
	mkdir -p "$(DIR)/etc/initramfs-tools/scripts/init-bottom"
	cp rootaufs "$(DIR)/etc/initramfs-tools/scripts/init-bottom/"
	
.PHONY: deb
deb: $(DIR)
	fpm -s dir -t deb -v $(VERSION) -n $(NAME) \
		-d "initramfs-tools" \
		-d "aufs-tools" \
		-d "grub-pc (>= 2.0)" \
		--after-install "post-install.sh" \
		-a all --prefix $(PREFIX) -C $(DIR) .