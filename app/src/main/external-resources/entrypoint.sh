cp config.template.json config.json
sed -i -e "s/BOT_TOKEN/$BOT_TOKEN/g" ./config.json
sh -c "./bin/start $@"