#!/usr/bin/env bash

cd $(dirname $0)

gitbook build src docs
