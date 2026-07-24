#!/bin/sh
set -e
cd "$(dirname "$0")/server"
if [ ! -d node_modules ]; then
  npm ci --omit=dev
  npx prisma generate
fi
npx prisma db push --skip-generate
export NODE_ENV=production
export PORT="${PORT:-8898}"
exec node dist/index.js
