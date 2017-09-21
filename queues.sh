start=$1
end=$2
touch /home/cloud/a.txt
for i in `seq $start $end`; do
    ./hubserver.sh manhole $i <<EOF
import json
sns = dict()
with open('/home/cloud/a.txt', 'a') as f:
    for uid, p in lb_factory.clients.iteritems():
        f.write(p.hub_serial_number + ',' + p.cmd_consumer_token.consumer_tag)
quit()
EOF
    sleep 1
done

