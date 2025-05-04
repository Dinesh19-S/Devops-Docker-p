FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm test  # Run tests during build
EXPOSE 3000
CMD ["npm", "start"]
