#!/bin/bash
echo 🌡"$(curl -s 'wttr.in/scottsdale?0QT' | cut -c 17- | grep °F | tr -d " ")"
