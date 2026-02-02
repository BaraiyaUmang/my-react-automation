FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install 
# This line is crucial—it copies your 'src' and other files
COPY . . 
EXPOSE 5173
# Vite requires --host to accept external connections
CMD ["npm", "run", "dev", "--", "--host"]
