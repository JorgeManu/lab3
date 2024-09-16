# Usa una imagen de Node como base
FROM node:14

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto de los archivos de tu proyecto
COPY . .

# Construye la aplicación de React
RUN npm run build

# Instala un servidor estático simple para servir la aplicación construida
RUN npm install -g serve

# Expone el puerto donde se servirá la aplicación
EXPOSE 5000

# Comando para iniciar la aplicación
CMD ["serve", "-s", "build", "-l", "5000"]
