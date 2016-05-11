FROM node:4.4.3

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.7.5

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/myapp/
RUN chown -R app:app $HOME/

USER app
WORKDIR $HOME/myapp
RUN npm install
RUN npm cache clean

CMD ["node", "index.js"]