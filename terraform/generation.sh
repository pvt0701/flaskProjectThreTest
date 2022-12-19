#!/bin/bash

  KEY_PATH=~/.ssh/blog
  EMAIL=pvt0701@gmail.com

  ssh-keygen -t rsa -b 4096 -f $KEY_PATH -C $EMAIL
  # Enter passphrase (empty for no passphrase): press Enter
  # Enter same passphrase again: press Enter
  chmod 600 $KEY_PATH
  ssh-add $KEY_PATH
  cat ${KEY_PATH}.pub