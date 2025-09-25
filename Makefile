
help:
	@less Makefile

edit:
	@nvim src/main.lua
run:
	@launch.sh

force.push:
	@git push -f

pull:
	@git pull

savetogit: commitall
	@echo '--> PUSH to GitHub..'
	@git push
commitall: addall
	@echo '--> COMMIT if STATUS allows..'
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
addall:
	@echo '--> ADD-ALL..'
	@git add .
