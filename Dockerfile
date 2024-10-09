# Usar una imagen base de Node.js
FROM node:16 AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el package.json y yarn.lock
COPY package.json yarn.lock ./

# Instalar las dependencias
RUN yarn install

# Copiar el resto de la aplicación
COPY . .

# Construir la aplicación
RUN yarn build

# Usar una imagen base de Nginx para servir la aplicación
FROM nginx:alpine

# Copiar los archivos de construcción de la etapa anterior
COPY --from=build /app/build /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
