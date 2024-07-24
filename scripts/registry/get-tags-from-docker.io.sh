#!/bin/bash

# Get all tags from library/busybox registry, change it for any othe registry from the hub, enjoy!

#1 url for token request
url_regs="https://auth.docker.io/token?service=registry.docker.io&scope=repository:library/busybox:pull"

#2 get access token valid 5 min, regenerate it if needed.
token=`curl -fsSL "$url_regs" | jq -r '.token'`

#3 url for tags
url_tags="https://registry-1.docker.io/v2/library/busybox/tags/list"


#4 all together
curl -fsSL -H "Accept: application/json" -H "Authorization: Bearer $token" "$url_tags" | jq -r '.tags[]'



