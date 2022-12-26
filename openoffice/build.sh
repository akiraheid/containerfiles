#!/bin/bash
set -e

installer=office.tar.gz

version=$(bash printVersion.sh)

#curl -o $installer https://versaweb.dl.sourceforge.net/project/openofficeorg.mirror/${version}/binaries/en-US/Apache_OpenOffice_${version}_Linux_x86-64_install-deb_en-US.tar.gz

echo "Create root image..."
podman build -t localhost/openoffice:latest -f Dockerfile
echo "Create root image... done"

#rm $installer

tools=(base calc draw impress math writer)
for i in "${tools[@]}"; do
	echo "Create $i..."
	podman build -t localhost/openoffice-$i:latest -f $i.Dockerfile
	echo "Create $i... done"
done
