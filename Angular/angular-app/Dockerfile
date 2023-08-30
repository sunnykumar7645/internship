# Stage 1: Build the Angular app
FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the app with Nginx
# Use a lightweight web server (such as Nginx) to serve the Angular app
FROM nginx:alpine

# Copy the built Angular app from the previous stage to the nginx public directory
COPY --from=build-stage /app/dist/angular-app /usr/share/nginx/html

# Copy the SSL certificate and configuration files to the container
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx/certificate.crt /etc/nginx/ssl/certificate.crt
COPY nginx/private.key /etc/nginx/ssl/private.key

# Expose the HTTPS port (default is 443)
EXPOSE 443

# Start the nginx web server
CMD ["nginx", "-g", "daemon off;"]
