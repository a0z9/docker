#!/bin/bash

# get image digest from local registry

# Change repository bbox and tag 1.34 to yours
# v.1
curl -H "Accept: application/vnd.docker.distribution.manifest.v2+json" --cacert certs/my.crt -u admin:pass -sI https://dock01:5002/v2/bbox/manifests/1.34  | grep docker-content-digest | sed 's/.*\(sha256:.*\)/\1/'


# v.2
curl -H "Accept: application/vnd.docker.distribution.manifest.v2+json" --cacert certs/my.crt -u admin:pass -s https://dock01:5002/v2/bbox/manifests/1.34 | sha256sum | sed 's/\(.*\) -/sha256:\1/'
