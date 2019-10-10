# nodejs

## Node Latest

目录 `builders/nodejs`
基于 `node:alpine`

### 构建`builder`镜像

```
make build
```

### 测试`builder`镜像

```
make test
```

### 发布`builder`镜像

```
make docker
```

### 使用`builder`镜像

```
s2i build [source dir] zdnscloud/s2i-nodejs-builder [app image name]
```

#### 构建过程

首先执行 `npm install` 或 `yarn install`

根据 `yarn.lock` 文件选择使用 `npm` 或 `yarn` 安装

#### 运行

运行`app image`时，会调用`npm start`

### Demo:

```shell
s2i build https://github.com/zdnscloud/singlecloud-ui zdnscloud/s2i-nodejs-builder sui
docker run -p 8080:3000 --rm sui
```
