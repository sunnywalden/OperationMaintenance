#!/bin/bash

randstr() {
  index=0
  str=""
  for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {A..Z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {1..20}; do str="$str${arr[$RANDOM%$index]}"; done
  echo "$str"
#  return "$str"
}
 


url='http://192.168.1.104:9200/.kibana/visualization/'

id=$1;
curl -XGET ${url}${id}|awk -F '_source":' '{print $2}'|grep '{"title":' > test.json && sed -i 's/}}}/}}/g' test.json
cp test.json new.json


pre_title='jc_某广告主mex渠道回调数统计'
title=$2

if [ -n "$title" ]
then
    sed -i "s/${pre_title}/$title/g" new.json
fi

pre_search='status:200 and source:mex and appid:12321042441'
search=$3
if [ -n "$search" ]
then
    sed -i "s/${pre_search}/$search/g" new.json
fi

#randstr
new_id=`randstr`
echo ${new_id}

new_id=randstr
echo ${new_id}

curl -XPOST ${url}${new_id} -d "`cat new.json`"
if [ $? -eq 0 ]
then
    echo "\nVisuazation create success!"
    echo "id:   ${new_id}"
    echo "title:   ${title}"
fi

