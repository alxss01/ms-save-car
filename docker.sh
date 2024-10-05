#!/bin/bash

docker build -t alexsouzasilva/ms-save-car:latest .

if [[ $? != 0 ]]; then
    echo "Falha ao exectar docker build..."
    exit 1
fi

sudo docker push alexsouzasilva/ms-save-car:latest

if [[ $? != 0 ]]; then
    echo "Falha ao exectar docker push..."
    exit 1
fi
