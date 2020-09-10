FROM node:14 as dependencies

COPY package.json /code/package.json
COPY yarn.lock /code/yarn.lock

WORKDIR /code
RUN yarn install


FROM nginx:1.19-alpine

COPY --chown=nginx ./ /usr/share/nginx/html
COPY --from=dependencies --chown=nginx /code/node_modules /usr/share/nginx/html/node_modules





