FROM nginx:stable-alpine

# use a volume is mor efficient and speed that filesystem
VOLUME /tmp

# Install web  app on nginx server
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY dist/billingApp /usr/share/nginx/html
COPY mime.types /etc/nginx/mime.types


# Install OpenJDK 17
RUN apk add --no-cache openjdk17-jre

# define the variable of environment JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# Verify the installation
RUN java -version

# Install Java microservice
ENV JAVA_OPTS=""
ARG JAR_FILE
ADD ${JAR_FILE} app.jar

#copy the init script
COPY appshell.sh /appshell.sh

#the port that the container will expose
EXPOSE 80 7080

ENTRYPOINT ["sh","appshell.sh"]