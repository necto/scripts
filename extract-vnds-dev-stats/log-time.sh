#!/bin/bash


DIFF=$(git diff-tree -r HEAD~ | grep counted-chains-map-opt-plan.org | wc -l)
#echo $(git diff-tree -r HEAD~)
if [ $DIFF -gt 0 ];
then
    bash get-time.sh >> times.txt
    
    wc nat/vignat/lib/containers/map.* \
        nat/vignat/lib/containers/double-map.* \
        nat/vignat/lib/containers/*.gh \
        nat/lib/containers/map.* \
        nat/lib/containers/double-map.* \
        nat/lib/containers/*.gh \
        | tail -n 1 | awk '{print $1}' >> lines.txt
    grep '^ *lemma ' nat/vignat/lib/containers/map.* \
        nat/vignat/lib/containers/double-map.* \
        nat/vignat/lib/containers/*.gh \
        nat/lib/containers/map.* \
        nat/lib/containers/double-map.* \
        nat/lib/containers/*.gh \
        | wc | tail -n 1 | awk '{print $1}' >> lemmas.txt
fi


