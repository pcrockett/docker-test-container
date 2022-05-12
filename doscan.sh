#!/usr/bin/env bash

ip="${1}"
nmap -Pn -T4 -pT:8000,5432,6379,5672,8025,1025 "${ip}"
