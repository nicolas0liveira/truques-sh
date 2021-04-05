#!/bin/bash
# Procura dicas no arquivo de truques
# Fred Camara - rev 2018-07-12, modificado por Nícolas
# colocar o arquivo em: i) /usr/local/bin ou ii) /local/share/bin  iii) no path

args=$@
arq=$HOME/truques-sh/truques

headers=$(sed -n '/^#/p' "$arq")

for i in $args; do
  headers=$(sed -n "/^#.*$i/Ip" <<< "$headers")
done

while read header; do
  sed -n "1,/^$header$/{s/^$header$/\o33[32m&\o33[0m/p;d};/^#/,\$d;p" "$arq"
done <<< "$headers"
