#!/bin/bash

# Azure App Service startup script for Next.js
cd /home/site/wwwroot

# Check Node.js version
echo "Current Node.js version:"
node --version

# Set Node.js version if needed
export NODE_VERSION=20.11.0

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm ci
fi

# Build the application if .next doesn't exist
if [ ! -d ".next" ]; then
    echo "Building Next.js application..."
    npm run build
fi

# Start the application
echo "Starting Next.js application..."
npm start
