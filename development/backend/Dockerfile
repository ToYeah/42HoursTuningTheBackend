FROM node:12-alpine
WORKDIR /backend
COPY src/ ./src
COPY package.json package-lock.json ./
RUN mkdir file
RUN mkdir file/static
RUN npm ci

ENTRYPOINT ["node", "--max-old-space-size=8192", "src/index.js"]
