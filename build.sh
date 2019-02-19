#!/usr/bin/env bash

cd $(dirname $0)

gitbook install src
gitbook build src docs
