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
 


url='http://192.168.1.104:9200/.kibana/dashboard/'

id='AV6j4N6dXzkjoKSYJR1F';
curl -XGET ${url}${id}|awk -F '_source":' '{print $2}'|grep '{"title":' > test.json && sed -i 's/}}}/}}/g' test.json
cp test.json new.json


pre_title='J&C_Dashboard'
title=$1

if [ -n "$title" ]
then
    sed -i "s/${pre_title}/$title/g" new.json
fi

#pre_search='status:200 and source:mex and appid:12321042441'
#search=$3

pre_v1='AV6j1CTJXzkjoKSYJR1B'
pre_v2='AV6j4Id3XzkjoKSYJR1E'
pre_v3='AV6j6AjiXzkjoKSYJR1H'
pre_v4='AV6j8St_XzkjoKSYJR1I'
pre_v5='AV6jpUtTXzkjoKSYJRHl'
for ((i=1;i<=5;i++))
do
    if [ -n "$i" ]
    then
        sed -i "s/pre_v${i}/${i+1}/g" new.json
    fi
done

#randstr
new_id=`randstr`
echo ${new_id}

#new_id=randstr
#echo ${new_id}

curl -XPOST ${url}${new_id} -d "`cat new.json`"
if [ $? -eq 0 ]
then
    echo "\ndashboard create success!"
    echo "id:   ${new_id}"
    echo "title:   ${title}"
fi

