#!/usr/bin/env bash

cd $(dirname $0)

gitbook serve src docs
