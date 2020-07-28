#!/usr/bin/env bash

mkdir -p $GOPATH/src/github.com/wercker
cd $GOPATH/src/github.com/wercker
git clone https://github.com/wercker/stern.git && cd stern
govendor sync
go install
