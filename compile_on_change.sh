#! /usr/bin/env /bin/bash

## Automatic compilation on change on .tex files

while sleep 1 ; do find . -name '*.tex' | entr make; done
