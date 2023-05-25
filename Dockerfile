FROM node:16-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN addgroup -g 1001 strapi && adduser -u 1001 -G strapi -s /bin/sh -D strapi

WORKDIR /opt/
COPY package.json yarn.lock ./
RUN yarn config set network-timeout 600000 -g && yarn install
ENV PATH /opt/node_modules/.bin:$PATH

WORKDIR /opt/app
RUN chown -R strapi:strapi /opt/app
USER strapi
COPY . .
RUN ["yarn", "build"]
EXPOSE 1337
CMD ["yarn", "develop"]