# Notes

## portainer

```bash
$ docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

## catalina-policy

As an example...

```
grant codeBase "file:${catalina.home}/webapps/jasper-bridge/-" {
       permission java.security.AllPermission;
};
```
