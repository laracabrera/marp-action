FROM armno/node-chromium:11.6.0-alpine

LABEL description "A GitHub Action to build every Marp Presentation in a folder to GitHub Pages"
LABEL repository "http://github.com/laracabrera/marp-action"

RUN apt update && apt install -y git

RUN npm install -g @marp-team/marp-cli@0.17.2

ENV IS_DOCKER true

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

