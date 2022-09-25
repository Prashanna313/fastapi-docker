#!/bin/bash


python3.8 -m pip install --upgrade pip && \
  pip install -e '.[build]'

curl https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_linux_amd64.zip \
  --output terraform_0.13.1_darwin_amd64.zip \
    && unzip terraform_0.13.1_darwin_amd64.zip
