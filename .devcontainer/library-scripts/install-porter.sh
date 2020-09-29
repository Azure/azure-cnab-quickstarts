#!/usr/bin/env bash

curl https://cdn.porter.sh/latest/install-linux.sh | bash
echo 'export PATH=$PATH:~/.porter' >>~/.bashrc