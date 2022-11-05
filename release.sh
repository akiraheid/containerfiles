set -ex

IMAGE="$1"
VERSION=`bash printVersion.sh ${IMAGE} | sed 's/\./ /g'`
VERSION=($VERSION)
echo $VERSION
TMP=
for ver in ${VERSION[@]}; do
	TMP="$TMP$ver"
	NAME="docker.io/akiraheid/$IMAGE:$TMP"
	podman tag "localhost/$IMAGE" "$NAME"
	podman push "$NAME"
	TMP="$TMP."
done
NAME="docker.io/akiraheid/$IMAGE:latest"
podman tag "localhost/$IMAGE:latest" "$NAME"
podman push "$NAME"
