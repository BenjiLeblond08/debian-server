.PHONY: install dotfiles clean-dofiles omz wsl sublime-text windows-terminal

configs=$(subst ./config/,,$(wildcard ./config/*))

install:
	sudo apt-get update -q -y
	sudo apt-get upgrade -y
	sudo apt-get install -y $(shell grep -vE "^\s*#" package.list | tr "\n" " ")

dotfiles:
	@for dir in ./dotfiles/*/ ; do \
		dir=$$(basename $${dir}); \
		echo $${dir}; \
		stow -v -d ./dotfiles -t ~ $${dir}; \
	done

clean-dofiles:
	@for dir in ./dotfiles/*/; do \
		for file in $$(find $${dir} -type f -print | sed "s|$${dir}||"); do \
			if [ -e ~/$${file} ]; then \
				rm ~/$${file}; \
			fi; \
		done; \
	done

oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	stow -v -d ./dotfiles -t ~ oh-my-zsh

wsl:
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar USERPROFILE)")" "$(shell wslvar USERNAME)"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar OneDrive)")" "OneDrive"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l Desktop)")" "Desktop"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l Personal)")" "Documents"
	cd ~ && ln -s "$(shell wslpath "$(shell wslvar -l {374DE290-123F-4565-9164-39C4925E467B})")" "Downloads"

sublime-text:
	cp -a -u "Sublime Text 3" "$(shell wslpath "$(shell wslvar APPDATA)")"

windows-terminal:
	cp -a -u WindowsTerminal/* "$(shell wslpath "$(shell wslvar LOCALAPPDATA)")/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
