#!/bin/bash
HLD="webscantest.com"
mkdir workspace
cd workspace
git clone https://github.com/Chaos-Monkey-Island/docker_burp.git
cd docker_burp
docker-compose up -d
cd ..
docker run -v /home/ibex/.config/amass:/.config/amass/ gcr.io/gcp-builder-project/amassy:latest enum  -v -src -ip -brute -min-for-recursive 2 -d $HLD
docker run -v /home/ibex/.config/amass:/.config/amass/ gcr.io/gcp-builder-project/amassy:latest viz -d3 -d $HLD
cat amass.txt | cut -d']' -f 2 | awk '{print $1}' | sort -u > hosts-amass.txt
cat domains.txt | docker run -i gcr.io/gcp-builder-project/httprobe:latest > uphosts.txt
filename="uphosts.txt"
declare -a myArray
myArray=(`cat "$filename"`)
#${myArray[$i]}
for site in $myArray
do
#curl -vgw "\\n" 'http://127.0.0.1:1337/v0.1/scan' -d '{"urls":["'"$site"'"]}'  > /dev/null 2>&1
#printf "Scanning %s with burp.\\n" "$site"
done
# todo : change scan to add scope


# AQUATONE

#CLEAN-IP
docker rmi -f $(docker images -a -q)

