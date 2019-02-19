#!/bin/bash

read -p "Digite um número: " NUM1
read -p "Digite outro número: " NUM2

echo "$NUM1 + $NUM2 = $(expr "$NUM1" + "$NUM2")"
