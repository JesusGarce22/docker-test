# Informe de Configuración y Ejecución de GitHub Actions para Docker

## Objetivo
El objetivo de este proyecto fue configurar un flujo de trabajo de GitHub Actions que permita construir y enviar imágenes de Docker a Docker Hub automáticamente.

## Pasos Realizados

### 1. Creacion de Dockerfile
- Se creó un dockerfile que ibamos a usar para desplegar la app en docker.

### 2. Archivo de Flujo de Trabajo de GitHub Actions
- Se creó un archivo de flujo de trabajo en `.github/workflows/docker.yml` con el siguiente contenido:

```
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v2
        with:
          push: true
          tags: your-dockerhub-username/docker-test:latest
```
### 3. Configuración de Secretos de GitHub

 * Se configuraron los secretos de GitHub para almacenar de manera segura las credenciales de Docker Hub (DOCKER_USERNAME y DOCKER_PASSWORD).

### 4. Ejecución del Flujo de Trabajo

* Se realizó un push a la rama main, lo que activó el flujo de trabajo.

* Se completaron los siguientes pasos en el flujo de trabajo:

    * **Checkout**: Se clonó el repositorio para acceder al código fuente.

    *  **Docker set up buildx:** Se configuró Docker Buildx para construir imágenes.
    * **Docker login:** Se autenticó en Docker Hub utilizando los secretos almacenados.
    * **Docker Build and push:** Se construyó y se envió la imagen a Docker Hub exitosamente.

### 5. Verificación
Se accedió a Docker Hub con el usuario jesusgarces22 para verificar que la imagen se había subido correctamente.