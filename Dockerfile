FROM node:22-alpine
WORKDIR /app

# Copy the repository without assuming a public/ folder exists.
COPY . .

# Install production dependencies from package.json.
RUN test -f package.json || (echo 'ERROR: package.json is missing from repository root' >&2; exit 1)
RUN npm install --omit=dev --no-audit --no-fund

ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "server.js"]
