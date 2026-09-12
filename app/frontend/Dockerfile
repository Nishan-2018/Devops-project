# Build Stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production

# Production Minimal Stage
FROM node:20-alpine
WORKDIR /app

# Run as non-root user for DevSecOps best practices
USER node

COPY --chown=node:node --from=builder /app/node_modules ./node_modules
COPY --chown=node:node server.js package.json ./

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3000/healthz || exit 1

CMD ["node", "server.js"]
