#!/bin/bash
sudo apt-get update
sudo apt-get install unzip
sudo apt-get install libwww-perl libdatetime-perl
cd ~
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
cd aws-scripts-mon
crontab - l >> mycron
echo "*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-util --from-cron" >> mycron
crontab mycron
rm mycron
