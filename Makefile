
GIT_TOP:=$(shell git rev-parse --show-toplevel)

# Inputs for `hard_copy` target.

# Where to copy from.
FROM?=

# Where to copy to.
TO?=

.PHONY: hard_copy
hard_copy:
	test -e "$(FROM)"
	rm -rf $(TO) 
	cp -r $(FROM) $(TO)

PULL_TARGETS:=
PUSH_TARGETS:=

# $(1) - Name of relation
# $(2) - Repo destination, relative to git top.
# $(3) - Real destination
# $(4) - Relative paths to delete when pulling in!
define COPY_RELATION
.PHONY: pull.$(1) push.$(1)

PULL_TARGETS+=pull.$(1)
pull.$(1):
	$$(MAKE) hard_copy FROM=$(3) TO=$(GIT_TOP)/$(2)
	# Does nothing if no paths are given!
	rm -rf $(addprefix $(GIT_TOP)/$(2)/,$(4))

PUSH_TARGETS+=push.$(1)
push.$(1):
	$$(MAKE) hard_copy FROM=$(GIT_TOP)/$(2) TO=$(3)
endef

$(eval $(call COPY_RELATION,nixos,nixos,/etc/nixos,))
$(eval $(call COPY_RELATION,nvim,nvim,$(HOME)/.config/nvim,plugin))
$(eval $(call COPY_RELATION,tmux,tmux,$(HOME)/.config/tmux,plugins))
$(eval $(call COPY_RELATION,hypr,hypr,$(HOME)/.config/hypr,))
$(eval $(call COPY_RELATION,waybar,waybar,$(HOME)/.config/waybar,))

.PHONY: pull.all push.all
pull.all: $(PULL_TARGETS)
push.all: $(PUSH_TARGETS)
