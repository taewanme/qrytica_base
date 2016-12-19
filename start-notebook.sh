#!/bin/bash
#
set -e

jupyter notebook --notebook-dir=~/ipython --no-browser --ip='*' --port=8888
