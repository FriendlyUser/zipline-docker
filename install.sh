#!/bin/sh
conda install python=3.6.9
conda install -c quantopian zipline
conda env export > environment.yml