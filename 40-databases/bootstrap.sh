#!/bin/bash
component = $1

dnf install ansible -y
ansible-pull -U https://github.com/GuddapathalaVineela/ansible-roboshop-roles-tf.git -e component = mongodb main.yaml