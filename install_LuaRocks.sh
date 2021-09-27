#! /usr/bin/env bash

set -ex

wget https://luarocks.org/releases/luarocks-3.7.0.tar.gz

tar zxpf luarocks-3.7.0.tar.gz

cd luarocks-3.7.0

./configure && make && sudo make install

luarocks --version