source common.sh
component=rabbitmq

echo -e " ${color}  Configure Erlang repos  ${nocolor} "
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>${log_file}

echo -e " ${color}  Configure RabbitMQ Repos  ${nocolor} "
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>${log_file}


echo -e " ${color}  Install RabbitMQ Server  ${nocolor} "
sudo yum install rabbitmq-server -y &>>${log_file}


echo -e " ${color}  Start RabbitMQ Service  ${nocolor} "
sudo systemctl enable rabbitmq-server &>>${log_file}
sudo systemctl restart rabbitmq-server &>>${log_file}


echo -e " ${color}  Add RabbitMQ Application User ${nocolor} "
rabbitmqctl add_user roboshop $1 &>>${log_file}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>${log_file}
