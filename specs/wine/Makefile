#!make
SHELL = /bin/sh

export DOCKER_BUILDKIT = 1

# Contains version tags for the build
VERSIONS = ./Versions
include $(VERSIONS)

# Contains the following constants:
# CON_RT = <podman|docker>
# ORGANIZATION = <username>
# REGISTRY = <registry-url>
# REPOSITORY = <git repository url>
BUILD_CONSTANTS = ../../build_constants.conf
include $(BUILD_CONSTANTS)

#branches := stable staging devel
branches := stable
name := wine

.PHONY: all
all: $(branches)

.PHONY: $(branches)
$(branches): image = $(ORGANIZATION)/$(name)-$@
$(branches): version = $(shell echo $($@_version) | sed 's/~.*//')
$(branches):
	@echo "Building $(image):$(version) ..."
	@$(CON_RT) build --pull \
		--build-arg CREATED_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ") \
		--build-arg REFNAME=$(version) \
		--build-arg REPOSITORY=$(REPOSITORY) \
		--build-arg WINE_BRANCH=$@ \
		--build-arg WINE_VERSION=$($@_version) \
		--cache-from $(image) \
		-t $(image):latest \
		-t $(image):$(version) \
		-t $(REGISTRY)/$(image):latest \
		-t $(REGISTRY)/$(image):$(version) \
		-f Containerfile \
		.

.PHONY: clean-branch
clean-branch: BRANCH := stable
clean-branch: image := $(REGISTRY)/$(name)-$(BRANCH)
clean-branch:
	@$(CON_RT) rmi -f \
		$$($(CON_RT) images --filter=reference="$(image)" --format="{{.ID}}") \
		2>/dev/null \
		|| echo "No image found matching \"$(image)\""

.PHONY: clean
clean:
	@for branch in $(branches) ; do $(MAKE) clean-branch BRANCH=$$branch ; done

.PHONY: push-branch
push-branch: BRANCH := stable
push-branch: image = $(ORGANIZATION)/$(name)-$(BRANCH)
push-branch: version = $(shell echo $($(BRANCH)_version) | sed 's/~.*//')
push-branch:
	@$(CON_RT) push $(REGISTRY)/$(image)
	@$(CON_RT) push $(image) $(image):$(version)
	# @$(CON_RT) tag $(image):$(version) $(image):latest
	# @$(CON_RT) tag $(REGISTRY)/$(image):$(version) $(REGISTRY)/$(image):latest

.PHONY: push
push:
	@for branch in $(branches) ; do $(MAKE) push-branch BRANCH=$$branch ; done
