FROM node:8.6.0
WORKDIR /code
COPY package.json package.json
RUN npm install
COPY build /code/build
COPY demo /code/demo

FROM node:8.6.0
COPY --from=0 /code /code
WORKDIR /code
EXPOSE 3000
ENTRYPOINT ["node", "demo/app.js"]

