#!/bin/bash

for i in $(cat hosts.txt)
do
    {
        if ping -c1 $i &>/dev/null
        then
            echo "$i OK"
        else
            echo "$i DOWN"
        fi
    } &
done
wait
echo "Done"


# #!/bin/bash

# for i in $(cat hosts.txt)
# do
#     ping -c1 $i &>/dev/null &
#     pids+=($!)
# done

# for p in "${pids[@]}"
# do
#     wait $p
# done

# echo "Done"
