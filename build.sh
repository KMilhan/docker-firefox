#!/bin/bash
SERVICE=firefox
VERSION=latest

read -p "Press [Enter] to build $SERVICE:$VERSION"
docker build -t $SERVICE:$VERSION .
