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

.PHONY: help


prepare:
	sudo pacman -Sy --needed php
.PHONY: prepare


app:
	php archcraft-openbox-style-select.sh > ../../archcraft-openbox-style-select
	chmod 755 ../../archcraft-openbox-style-select
.PHONY: app
