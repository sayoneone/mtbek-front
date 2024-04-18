FROM alpine:latest AS build-env

RUN apk add git bash curl unzip

ARG FLUTTER_SDK=/usr/local/flutter
ARG APP=/app/

RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
RUN cd $FLUTTER_SDK

ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"
ENV FLUTTER_WEB true

RUN flutter channel master
RUN flutter doctor -v

RUN mkdir $APP
COPY . $APP
WORKDIR $APP

RUN flutter clean
RUN flutter pub get
RUN flutter pub run build_runner build --delete-conflicting-outputs
RUN flutter build web

FROM nginx:1.24.0-alpine

COPY --from=build-env /app/build/web /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

COPY --from=build-env /app/docker/dev/nginx/nginx.conf /etc/nginx/
