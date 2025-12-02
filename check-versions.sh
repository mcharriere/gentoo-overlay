#!/bin/bash


EBUILD=app-admin/hubble-bin
REPO="cilium/hubble"

arr01=("app-admin/hubble-bin" "cilium/hubble")
arr02=("app-admin/cilium-cli-bin" "cilium/cilium-cli")
arr03=("app-admin/dyff-bin" "homeport/dyff")
arr04=("app-admin/egctl-bin" "envoyproxy/gateway")
arr05=("app-admin/k6-bin" "grafana/k6")
arr06=("app-misc/gwctl" "kubernetes-sigs/gwctl")
arr07=("app-admin/teleport-bin" "gravitational/teleport")
arr08=("app-containers/kubeswitch" "danielfoehrKn/kubeswitch")
arr09=("app-misc/omm" "dhth/omm")
arr10=("app-misc/dasel" "TomWright/dasel")
arr11=("app-misc/fluxcd-bin" "fluxcd/flux2")
arr=(arr01 arr02 arr03 arr04 arr05 arr06 arr07 arr08 arr09 arr10 arr11)

declare -n elmv1 elmv2

for elmv2 in "${arr[@]}"; do
    EBUILD="${elmv2[0]}"
    REPO="${elmv2[1]}"

    LATEST=`gh release -R $REPO list --json tagName,isLatest --jq '.[] | select(.isLatest)|.tagName'`
    OLD=`ls $EBUILD/*.ebuild | head -n 1`

    echo "https://github.com/$REPO | $OLD | $LATEST"
done

exit 0



