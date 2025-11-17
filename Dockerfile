FROM node:18-alpine
WORKDIR /app
COPY app/ /app
RUN npm install --production || true
EXPOSE 3000
CMD ["node", "app.js"]

