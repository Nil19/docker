# 2048 Game

FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >>/etc/nginx/nginx.conf

RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master

RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 8080

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

#FROM node:latest

# Copy package.json, wildcard used so both package.json AND package-lock.json are copied
# slash '/' at the end of app is important, so it created an app directory, otherwise you'll get an error
#COPY package.json /app/

# Copy app files from src directory
#COPY src /app/

# Create app directory & set default dir so that next commands executes in /usr/app dir, liked cd-ing into /usr/app to execute npm install
#WORKDIR /app

# Install app dependencies
#RUN npm install

# Start the application
#CMD ["node" , "server.js"]


# https://www.youtube.com/watch?v=XeoZstvyew8 for new docker project
# 2048 game using docker and AWS 