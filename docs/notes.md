# Notes

## catalina-policy

As an example...

```
grant codeBase "file:${catalina.home}/webapps/jasper-bridge/-" {
       permission java.security.AllPermission;
};
```
