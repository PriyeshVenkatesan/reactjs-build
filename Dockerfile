
#  Deploying to nginx

FROM nginx:1.27.0-alpine-slim

# Copy the jar from local to image

ARG APP_HOME="/usr/share/nginx/html/"

COPY ./build ${APP_HOME}


WORKDIR ${APP_HOME}

EXPOSE 80
# nginx startup
CMD ["nginx", "-g", "daemon off;"]
