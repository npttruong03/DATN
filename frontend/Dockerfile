# 1. Base image Node.js 23.11.0
FROM node:23.11.0

# 2. Set working directory
WORKDIR /app

# 3. Copy package files first (cache npm install)
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy source code
COPY . .

# 6. Expose port Vite dev server
EXPOSE 5173

# 7. Start Vite dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
