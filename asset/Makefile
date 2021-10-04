default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make prepare'
	@echo
	@echo '	$$ make app'
	@echo
	@echo '	$$ make install'
	@echo
	@echo '	$$ make asset-install'
	@echo
	@echo '	$$ make bash-completion-install'
	@echo

.PHONY: help


prepare:
	sudo pacman -Sy --needed bash-completion fzf ueberzug
.PHONY: prepare


app:
	make -C ./gen/archcraft-openbox-style-select app
.PHONY: app


bash-completion-install:
	sudo install -Dm644 ./completion/bash/archcraft-openbox-style-select /usr/local/share/bash-completion/completions/archcraft-openbox-style-select
.PHONY: bash-completion-install


install: app
	install -Dm755 ./archcraft-openbox-style-select ~/.local/bin/archcraft-openbox-style-select
.PHONY: install


asset-install:
	install -dm755 ~/.config/openbox/share
	cp -ru share/style ~/.config/openbox/share
.PHONY: asset-install
