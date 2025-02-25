# Lexces catalog development setup

This Docker setup is currently in development.

If you use Windows, ensure that core.autocrlf is set to false in your git client before you clone the Lexces catalog
repository: _git config --global core.autocrlf false_ Otherwise the Docker images may not work due to line
ending changes.

## Pulling the images

You can pull the images from GHCR in the following way:

```
docker compose pull
```

## Building the images

Alternatively, you can build the images locally in the following way

```
./build-local-images.sh
```

## Using the Docker setup

First add an entry to your `/etc/hosts` file (or equivalent) so that queries for the development setup
interface resolve to your loopback interface. For example:

```
127.0.0.1 lexces-catalog.ckan
```

Start the Docker Compose setup:
```
docker compose up
```

Wait until CKAN has started. Then navigate to [https://lexces-catalog.ckan:18443](https://lexces-catalog.ckan:18443) in your browser. The
development VM runs with self-signed certificates, so you'll need to accept the security warning.
