

leader="$(curl http://192.168.56.104:8700/v1/status/leader | sed  's/:8300//' | sed 's/"//g')"
while :
do
	serviceID="$(curl http://192.168.56.104:8700/v1/health/state/critical | ./jq '.[0].ServiceID' | sed 's/"//g')"
	node="$(curl http://192.168.56.104:8700/v1/health/state/critical | ./jq '.[0].Node' | sed 's/"//g')"
	echo "serviceID=$serviceID, node=$node"
	size=${#serviceID}
	echo "size=$size"
if [ $size -ge 7 ]; then
	curl --request PUT http://$192.168.56.104:8700/v1/agent/service/deregister/$serviceID
else
break
fi
done
	curl http://192.168.56.104:8700/v1/health/state/critical