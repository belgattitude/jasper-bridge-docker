# jasper-bridge-docker

Repo to create a docker image with ready-to-run '[php-java-bridge](https://github.com/belgattitude/php-java-bridge)/[jasper-reports](https://community.jaspersoft.com/project/jasperreports-library)' servlet under tomcat.

> See also [soluble-japha](https://github.com/belgattitude/soluble-japha) and [soluble-jasper](https://github.com/belgattitude/soluble-jasper) projects.
  

# Docker development

## Build the image locally. 

```bash
$ docker build -t pjb_docker_image .
```

## Launch the image in a container

```bash
$ docker run -d -p 8888:8080 -p 9267:9267 --name pjb_docker_container pjb_docker_image
```

> Tomcat is now available on port 8888 from the host. 

> Open [http://localhost:8888/jasper-bridge](http://localhost:8888/jasper-bridge) to access the java bridge dashboard.


## Optional

### Shell into the container

```bash
$ docker exec -it pjb_docker_container bash
```

### Stop the container

```bash
$ docker stop pjb_docker_container
```

### Remove the container

```bash
$ docker rm pjb_docker_container
```


# Using docker-compose

## Customize

Use the provided [docker-compose.yml](./docker-compose.yml) file.

## Commands

```bash
$ docker-compose up
```    

```bash
$ docker-compose down
```    

# jasper-bridge servlet

## Build

To (re-)build the jasper-bridge servlet, simply execute:

```bash
$ ./scripts/build-jasper-bridge-servlet.sh
```

> Currently runs under linux.

## Customize 

Please refer to the following files:

- Dependencies can be customized using the [./scripts/build.gradle](./scripts/build.gradle) file.
- Optionally edit the [web.xml](./scripts/web.xml) before packaging.
- *Take a look to the [build-jasper-bridge-servlet.sh](./scripts/build-jasper-bridge-servlet.sh) file for more info.*

   

 


