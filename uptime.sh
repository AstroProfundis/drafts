#!/bin/sh

cd /home/allen/mc.atr.me/www
ruptime="$($_CMD uptime)"
if $(echo $ruptime | grep -E "day|min" >/dev/null); then
    x=$(echo $ruptime | awk '{ print $3 " " $4 " " $5}')
else
    x=$(echo $ruptime | sed s/,//g| awk '{ print "0 day, " $3 }')
fi
ruptime="$x"

rload="$($_CMD uptime | awk -F'average:' '{ print $2}')"
#x="$(echo $rload | sed s/,//g | awk '{ print $2}')"

echo "- Uptime:" $ruptime "Load average:" $rload | cat > in1.html

cat in0.html in1.html in2.html > default.html
