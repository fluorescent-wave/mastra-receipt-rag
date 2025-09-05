FROM node:20-alpine

WORKDIR /app

# Install Deps
COPY package*.json pnpm-lock.yaml* ./
RUN corepack enable pnpm && pnpm i --frozen-lockfile

# Copy Sources
COPY src ./src
RUN npx mastra build
RUN apk add --no-cache gcompat
 
# Default ENV
ENV PORT=8080
ENV NODE_ENV=production
ENV READINESS_CHECK_PATH="/api"
 
EXPOSE 8080

CMD ["node", ".mastra/output/index.mjs"]