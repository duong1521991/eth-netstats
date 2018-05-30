## Build via:
#
# docker build -t netstats:latest .
#
## Run via:
#
# docker run -d \
# -e WS_SECRET='test' \
# -e PORT='8888' \
# -p 8888:8888 \
# netstats:latest

FROM node:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
RUN npm install -g grunt-cli
COPY . /usr/src/app
RUN grunt all
EXPOSE 8888
CMD ["npm", "start"]