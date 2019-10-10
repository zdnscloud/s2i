# nodejs

目录 `builders/nodejs`

构建`builder`镜像
```
make build
```

测试`builder`镜像
```
make test
```

发布`builder`镜像
```
make docker
```

使用`builder`镜像

```
s2i build [source dir] zdnscloud/s2i-nodejs-builder [app image name]
```

builder 支持 `npm` 或 `yarn` 安装

运行`app image`时，会调用`npm start`
