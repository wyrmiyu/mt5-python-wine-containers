#!make
SHELL = /bin/sh

export DOCKER_BUILDKIT = 1

# Contains pywine image version tags for the build
PYWINE_VERSIONS = ./Versions.pywine
include $(PYWINE_VERSIONS)

# Contains the following constants:
# CON_RT = <podman|docker>
# ORGANIZATION = <github-user|github-org>
# REGISTRY = <registry-url>
# REPOSITORY = <git-repository-url>
BUILD_CONSTANTS = ../build_constants.conf
include $(BUILD_CONSTANTS)

branches := 3.10
name := metatrader5

.PHONY: all
all: $(branches)

.PHONY: $(branches)
$(branches): image = $(ORGANIZATION)/$(name)
$(branches): version = pywine-$@
$(brancehs): pywine_version = $($@_version)
$(branches): base_image = $(REGISTRY)/$(ORGANIZATION)/pywine-$@:$(pywine_version)
$(branches):
	@echo "Building $(image):$(version) ..."
	@$(CON_RT) build --pull \
		--cache-from $(image):latest \
		--build-arg CREATED_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ") \
		--build-arg REFNAME=$(version) \
		--build-arg REPOSITORY=$(REPOSITORY) \
		--build-arg BASE_IMAGE=$(base_image) \
		--build-arg MT_VERSION=5 \
		-t $(image):latest \
		-t $(image):$(version) \
		-t $(image):$(version)-$(pywine_version)
		-t $(REGISTRY)/$(image):latest \
		-t $(REGISTRY)/$(image):$(version) \
		-t $(REGISTRY)/$(image):$(version)-$(pywine_version) \
		-f Containerfile \
		.

.PHONY: clean
clean: image := $(REGISTRY)/$(name)
clean:
	@$(CON_RT) rmi -f \
		$$($(CON_RT) images --filter=reference="$(image)" --format="{{.ID}}") \
		2>/dev/null \
		|| echo "No image found matching \"$(image)\""

.PHONY: push-branch
push-branch: version := pywine-$(BRANCH)
push-branch: pywine_version = $($(BRANCH)_version)
push-branch: image := $(ORGANIZATION)/$(name)
push-branch: additional_tags := latest $(version)-$(pywine_version)
push-branch:
	@$(CON_RT) push $(image):$(version)
	@$(CON_RT) push $(REGISTRY)/$(image):$(version)
	@for tag in additional_tags ; do
		@$(CON_RT) tag $(image):$(version) $(image):$(tag)
		@$(CON_RT) tag $(REGISTRY)/$(image):$(version) $(REGISTRY)/$(image):$(tag)
	done

.PHONY: push
push:
	@for branch in $(branches) ; do $(MAKE) push-branch BRANCH=$$branch ; done
