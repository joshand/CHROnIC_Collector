#!/bin/bash
dd if=/dev/urandom bs=6 count=1 2>/dev/null | base64 | tr '+/' '_-' > /tmp/channel.id
