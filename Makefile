.PHONY: install config omz wsl sublime-text

configs=$(subst ./config/,,$(wildcard ./config/*))

install:
	sudo apt-get update -q -y
	sudo apt-get upgrade -y
	sudo apt-get install -y $(shell grep -vE "^\s*#" package.list | tr "\n" " ")

config:
	for dir in $(configs) ; do \
		cd ./config && stow -v -t ~ $$dir
	done

omz:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cd config && stow -v -t ~ omz

wsl:
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar USERPROFILE)")" "$(shell wslvar USERNAME)"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar OneDrive)")" "OneDrive"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l Desktop)")" "Desktop"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l Personal)")" "Documents"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l {374DE290-123F-4565-9164-39C4925E467B})")" "Downloads"

sublime-text:
	cp -a -u "Sublime Text 3" "$(shell wslpath "$(shell wslvar AppData)")"
