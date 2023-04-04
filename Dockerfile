FROM dart

WORKDIR /app

COPY pubspec.* /app

RUN dart pub get

COPY . /app/

RUN dart pub get --offline --no-precompile

RUN dart pub global activate conduit

WORKDIR /app
EXPOSE 80

ENTRYPOINT ["dart", "pub", "run", "conduit:conduit", "serve", "--port", "80"]