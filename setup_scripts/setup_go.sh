#! /bin/bash

INSTALL_DIR=$HOME/usr/local
GO_DL=https://dl.google.com/go/go1.10.linux-amd64.tar.gz

wget -O - $GO_DL | tar xvz - -C $INSTALL_DIR

mkdir -p $HOME/projects/go

echo 'export GOPATH=$HOME/projects/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile

source ~/.profile

go get -u github.com/sourcegraph/go-langserver
go get -u github.com/nsf/gocode