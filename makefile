.PHONY: clean dot_link

VIM_FILES = autoload colors ultisnips bundles testbundles addons

DOT_FILES = ack bash editorconfig git ssh tmux vim wget

HOME_DIR = ${HOME}
CWD = ${PWD}

all: clean vim_link dot_link

hello:
	@echo "Running pre-commit"

clean: $(VIM_FILES) $(DOT_FILES)

clean_dot: $(DOT_FILES)

dot_link1:
	@echo "Creating dot Symlink "
dot_link:
	@echo "Creating dot Symlink "
	for i in $(DOT_FILES)  ; \
	do	\
		echo $$i/; \
		stow $$i/; \
	done
	@echo "link completed."

$(VIM_FILES) :
	@echo "Remove Symlink $(HOME)/.vim/$@"
	@$(RM) $(HOME)/.vim/$@ 2>/dev/null

$(DOT_FILES) :
	@echo "Remove Symlink $(HOME)/.$@"
	@$(RM) $(HOME)/.$@ 2>/dev/null

# vim: noexpandtab
