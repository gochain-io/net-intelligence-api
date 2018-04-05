FROM debian

RUN apt-get update &&\
    apt-get install -y curl git-core gnupg &&\
    apt-get update &&\
    curl -sL https://deb.nodesource.com/setup_6.x | bash - &&\
    apt-get install -y nodejs

RUN apt-get update &&\
    apt-get install -y build-essential

RUN adduser netintel

ADD * /home/netintel/

RUN cd /home/netintel &&\
    npm install &&\
    npm install -g pm2

RUN echo '#!/bin/bash\nset -e\n\ncd /home/netintel\n/usr/bin/pm2 start ./app.json\ntail -f \
    /home/netintel/.pm2/logs/node-app-out-0.log' > /home/netintel/startscript.sh

RUN chmod +x /home/netintel/startscript.sh &&\
    chown -R netintel. /home/netintel

USER netintel
ENTRYPOINT ["/home/netintel/startscript.sh"]
