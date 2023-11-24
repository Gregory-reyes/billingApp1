## Ejecutamos el comando de docker compilar la imagen

```
docker build -t billingapp --no-cache --build-arg JAR_FILE=target/*.jar .
```
## creamos el contenedor con el comando

```
    docker run -d -p 80:80 -p 7080:7080 --name  billingapp1  billingapp
```

## Enviar la imagen al container registry se debe crear el espacio del contenedor en mi caso hub.docker.com y ejecutamos el comando

```
docker tag billingapp  gregoryreyesp/billingapp:latest
```
## subir la imagen al container registry latest o se ajusta de acuerdo a la version

```
docker push gregoryreyesp/billingapp:latest
```

## logearse si es necesario con el comando y colocar el usuario y contraseña de docker hub y cerrar la sesion si es necesario
```
docker login

docker logout
```

