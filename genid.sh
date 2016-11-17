#!/bin/bash
filename="/tmp/channel.id"
if [ ! -f $filename ]; then
    dd if=/dev/urandom bs=6 count=1 2>/dev/null | base64 | tr '+/' '_-' > $filename
fi
