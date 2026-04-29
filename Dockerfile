FROM nginx:1.27-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Create custom config inline
RUN printf "events {}\n\
http {\n\
  server {\n\
    listen 80;\n\
    location / {\n\
      return 200 'Custom NGINX without COPY';\n\
      add_header Content-Type text/plain;\n\
    }\n\
  }\n\
}\n" > /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
