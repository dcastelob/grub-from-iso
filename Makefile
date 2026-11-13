PKGNAME ?= grub-from-iso
DESTDIR ?=

.PHONY: install uninstall get-dsl

install:
	@install -Dm755 -t "$(DESTDIR)/etc/grub.d/" 		files/99_grub-from-iso
	@install -Dm644 -t "$(DESTDIR)/etc/default/" 		files/grub-from-iso
	@install -Dm755 -t "$(DESTDIR)/usr/local/bin/" 		files/get-dsl-rescue-iso.sh
		
	@$(MAKE) get-dsl

	cp -pv /boot/grub/grub.cfg /boot/grub/grub.cfg_$$(date "+%Y%m%d_%H%M%S")
	update-grub || grub-mkconfig -o /boot/grub/grub.cfg
	
uninstall:
	rm -f $(DESTDIR)/etc/grub.d/99_grub-from-iso
	rm -f $(DESTDIR)/etc/default/grub-from-iso
	rm -f $(DESTDIR)/usr/local/bin/get-dsl-rescue-iso.sh

	cp -pv /boot/grub/grub.cfg /boot/grub/grub.cfg_$$(date "+%Y%m%d_%H%M%S")
	update-grub || grub-mkconfig -o /boot/grub/grub.cfg

get-dsl:
	/usr/local/bin/get-dsl-rescue-iso.sh;
	
