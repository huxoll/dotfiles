#!/bin/zsh

for i in ./*.webp ; do mv "$i" "${i/\[NoGrid\]/}" ; done
