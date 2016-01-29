#!/bin/bash

set -e

qmake {%= name %}.pro
make

killall {%= name %} || true
./{%= name %}
