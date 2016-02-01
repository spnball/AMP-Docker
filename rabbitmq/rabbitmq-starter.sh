
while true
do
    UP=$(mysql --host="$MYSQL_HOST" --user="$MYSQL_USER" --password="$MYSQL_ROOT_PASSWORD" \
    -e "show databases;" 2>/dev/null | grep information_schema | wc -l
);
    if [ "$UP" -ne 0 ];
    then
        echo `date +%Y-%m-%d:%H:%M:%S` "Start checking data import.";
        break;
    else
        echo `date +%Y-%m-%d:%H:%M:%S` "Waiting for rabbit starting up.";
    fi
    sleep 1
done

rabbitmqadmin declare exchange name=status_exchange type=fanout
rabbitmqadmin declare exchange name=order type=topic
rabbitmqadmin declare exchange name=pickup type=topic
rabbitmqadmin declare exchange name=return type=topic


rabbitmqadmin declare queue name=status_queue durable=false

