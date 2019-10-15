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

#### 构建过程

支持的环境变量配置

- MVN_GOALS
- MVN_SKIP_TESTS
- MVN_OPTS

调用maven，执行：

```shell
mvn ${MVN_GOALS:-clean package} -DskipTests=${MVN_SKIP_TESTS:-true} \
  -Dmaven.skip.tests=${MVN_SKIP_TESTS:-true} ${MVN_OPTS}

```

根据`pom.xml`构建 `jar` 包，只支持构建单个 `jar` 包，将 `jar` 包拷贝到 `/opt/app-root/app.jar`


#### 运行

支持的环境变量配置

- JAVA_PARAMS

执行：

```shell
exec java $JAVA_PARAMS -jar /opt/app-root/app.jar
```
