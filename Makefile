
GIT_TOP:=$(shell git rev-parse --show-toplevel)

FROM?=
TO?=

.PHONY: hard_copy
hard_copy:
	# Confirm both from/to exist before doing anything!
	test -e "$(FROM)"
	test -e "$(TO)"
	rm -rf $(TO) # Always will succeed.
	cp -r $(FROM) $(TO)

# Nixos targets

REPO_NIXOS:=$(GIT_TOP)/nixos
REAL_NIXOS:=/etc/nixos

.PHONY: pull.nixos push.nixos
pull.nixos:
	$(MAKE) hard_copy FROM=$(REAL_NIXOS) TO=$(REPO_NIXOS)

push.nixos:
	$(MAKE) hard_copy FROM=$(REPO_NIXOS) TO=$(REAL_NIXOS)

# Neovim targets

REPO_NVIM:=$(GIT_TOP)/nvim
REAL_NVIM:=$(HOME)/.config/nvim

.PHONY: pull.nvim push.nvim
pull.nvim:
	$(MAKE) hard_copy FROM=$(REAL_NVIM) TO=$(REPO_NVIM)
	rm -rf $(REPO_NVIM)/plugin

push.nvim:
	$(MAKE) hard_copy FROM=$(REPO_NVIM) TO=$(REAL_NVIM)

# Tmux targets

REPO_TMUX:=$(GIT_TOP)/tmux
REAL_TMUX:=$(HOME)/.config/tmux

.PHONY: pull.tmux push.tmux
pull.tmux:
	$(MAKE) hard_copy FROM=$(REAL_TMUX) TO=$(REPO_TMUX)
	rm -rf $(REPO_TMUX)/plugins

push.tmux:
	$(MAKE) hard_copy FROM=$(REPO_TMUX) TO=$(REAL_TMUX)

# All targets!

.PHONY: pull.all push.all
pull.all: pull.nixos pull.nvim pull.tmux
push.all: push.nixos push.nvim push.tmux
