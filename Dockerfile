FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
# THIS LINE COPIES YOUR ACTUAL CODE. WITHOUT THIS, IT CRASHES.
COPY . . 
EXPOSE 5173
# VITE NEEDS --host TO WORK IN DOCKER.
CMD ["npm", "run", "dev", "--", "--host"]
