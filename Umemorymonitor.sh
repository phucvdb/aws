#!/bin/bash
sudo apt-get update
sudo apt-get install unzip
sudo apt-get install libwww-perl libdatetime-perl
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
sudo mv CloudWatchMonitoringScripts-1.2.1.zip /opt/
cd /opt
sudo unzip CloudWatchMonitoringScripts-1.2.1.zip
sudo rm CloudWatchMonitoringScripts-1.2.1.zip
cd /opt/aws-scripts-mon
sudo crontab - l >> mycron
sudo echo "*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-util --from-cron" >> mycron
sudo crontab mycron
sudo rm mycron
