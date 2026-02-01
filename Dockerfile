FROM node:22-alpine

WORKDIR /app

# Copy dependency files
COPY package*.json ./

RUN npm install 

# IMPORTANT: Copy EVERYTHING else (including the src folder)
COPY . .

# Vite usually uses 5173
EXPOSE 5173

# Most React/Vite apps use 'npm run dev' to start the server
CMD ["npm", "run", "dev", "--", "--host"]
