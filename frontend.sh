component=frontned
color="\e[36m"
nocolor="\e[0m"


echo -e "${color} Install nginx ${nocolor}"
yum install nginx -y

echo -e "${color} Removing default content ${nocolor}"
rm -rf /usr/share/nginx/html/*

echo -e "${color} Download Application Content ${nocolor}"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /usr/share/nginx/html
unzip /tmp/${component}.zip

echo -e "${color} copy ${component} configuration file ${nocolor}"
cp /home/centos/roboshop-scripts/${component}.service /etc/nginx/default.d/roboshop.conf

echo -e "${color} Starting ${component} service ${nocolor}"
systemctl enable nginx
systemctl start nginx
systemctl restart nginx