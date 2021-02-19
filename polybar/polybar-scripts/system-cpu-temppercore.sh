#!/bin/sh
sensors | grep Tdie | echo cpu: "$(awk '{ print substr( $0, length($0) - 7, length($0) ) }')"

