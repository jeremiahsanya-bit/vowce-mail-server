FROM cirrusci/flutter:3.22.2

WORKDIR /app

COPY pubspec.yaml pubspec.yaml
RUN flutter pub get

COPY . .

CMD ["dart", "run", "bin/admin_server.dart"]
