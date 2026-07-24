@echo off
setlocal
cd /d "%~dp0server"
if not exist node_modules (
  call npm ci --omit=dev
  call npx prisma generate
)
call npx prisma db push --skip-generate
set NODE_ENV=production
if "%PORT%"=="" set PORT=8898
node dist\index.js
