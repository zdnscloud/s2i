# java

## maven

目录 `builders/maven-java`
基于 `openshift/base-centos7`

### 构建`builder`镜像

```
make build
```

### 发布`builder`镜像

```
make docker
```

### 使用`builder`镜像

```
s2i build [source dir] zdnscloud/s2i-php-builder [app image name]
```
