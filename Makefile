# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))

# Remove directories that aren't images we manage
SUBDIRS:=$(subst grype,,$(SUBDIRS))
SUBDIRS:=$(subst scans,,$(SUBDIRS))
SUBDIRS:=$(subst trivy,,$(SUBDIRS))
SUBDIRS:=$(subst x11docker,,$(SUBDIRS))

SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
SUBDIRS_SCAN:=$(patsubst %,%-scan ,$(SUBDIRS))
dive=docker.io/wagoodman/dive:v0.10.0
grype=docker.io/anchore/grype:v0.55.0

.default: all

.PHONY: test
test:
	echo $(SUBDIRS)

.PHONY: all
all: clean update $(SUBDIRS) ## Make all images. Make a specific image by specifying the directory as a target

.PHONY: check-clean
check-clean:
	if [ -d scans ]; then echo "Delete scans directory"; exit 1; fi

.PHONY: clean
clean: ## Delete all build files
	-rm -r scans

.PHONY: html
html: ## Make scan result html page
	python3 makeGhPage.py

.PHONY: release
release: clean $(SUBDIRS_RELEASE) ## Push the images to docker.io

.PHONY: scan
scan: check-clean clean $(SUBDIRS_SCAN) ## Scan the images for vulnerabilites

.PHONY: update
update: ## Update base images
	podman pull docker.io/library/alpine:3
	podman pull docker.io/library/python:3-slim-bookworm
	podman pull docker.io/library/ubuntu:22.04

.PHONY: $(SUBDIRS)
$(SUBDIRS): ## Make a specific image
	bash build.sh $@

.PHONY: $(SUBDIRS_RELEASE)
$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

.PHONY: $(SUBDIRS_SCAN)
$(SUBDIRS_SCAN):
	mkdir -p scans
	-rm -r scans/*.tar
	IMAGE=$(patsubst %-scan,%,$@) \
		&& ARCHIVE=$${IMAGE}.tar \
		&& podman save -o scans/$${ARCHIVE} $${IMAGE} \
		&& podman run --rm -e CI=true -v ${PWD}/scans/:/data/:ro ${dive} --source docker-archive /data/$${ARCHIVE} \
			| tee scans/$${IMAGE}-dive.txt \
		&& podman run --rm -e GRYPE_DB_CACHE_DIR=/db -v grype-db:/db -v ${PWD}/scans/:/data/:ro ${grype} /data/$${ARCHIVE} \
			| tee scans/$${IMAGE}-grype.txt
	-rm -r scans/*.tar

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'
