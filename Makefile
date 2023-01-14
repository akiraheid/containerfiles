# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
SUBDIRS_SCAN:=$(patsubst %,%-scan ,$(SUBDIRS))
dive=docker.io/wagoodman/dive:v0.10.0
grype=docker.io/anchore/grype:v0.55.0

all: clean update $(SUBDIRS)

check-clean:
	[ -d scans ] && echo "Delete scans directory" && exit 1

clean:
	-rm -r scans

html:
	python3 makeGhPage.py

release: clean $(SUBDIRS_RELEASE)

scan: check-clean clean $(SUBDIRS_SCAN)

update:
	podman pull docker.io/library/alpine:3
	podman pull docker.io/library/ubuntu:22.04

$(SUBDIRS):
	bash build.sh $@

$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

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

.PHONY: all check-clean clean html release update $(SUBDIRS) $(SUBDIRS_RELEASE) $(SUBDIRS_SCAN)
