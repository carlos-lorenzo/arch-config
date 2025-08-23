#! /usr/bin/env bash

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo groupadd docker
sudo usermod -aG docker $USER