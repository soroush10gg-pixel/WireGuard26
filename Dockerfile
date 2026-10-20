FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY . .
RUN test -f package.json || (echo 'ERROR: package.json is missing from repository root' >&2; exit 1)
RUN test -f server.js || (echo 'ERROR: server.js is missing from repository root' >&2; exit 1)
RUN npm install --omit=dev --no-audit --no-fund
EXPOSE 3000
CMD ["node", "server.js"]
