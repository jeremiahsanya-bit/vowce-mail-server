FROM dart:stable

WORKDIR /app

# Install Flutter SDK manually
RUN apt-get update && apt-get install -y curl git unzip xz-utils
RUN git clone https://github.com/flutter/flutter.git /sdks/flutter -b stable --depth 1
ENV PATH="/sdks/flutter/bin:/sdks/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Accept Android licenses (no-op for pure Dart server, but prevents warnings)
RUN flutter doctor --android-licenses || true

COPY pubspec.yaml pubspec.yaml
RUN flutter pub get

COPY . .

CMD ["dart", "run", "bin/admin_server.dart"]
