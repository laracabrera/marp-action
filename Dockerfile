FROM node:13.10

LABEL description "A GitHub Action to build every Marp Presentation in a folder to GitHub Pages"
LABEL repository "http://github.com/laracabrera/marp-action"

RUN apt update && apt install -y git chromium-browser

RUN npm install -g @marp-team/marp-cli@0.17.2

ENV IS_DOCKER true

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

