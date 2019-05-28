# Adsforce Docs

## 安装 Node.js

`https://nodejs.org/en/download/`

## 安装 Git

`https://git-scm.com/downloads`

### Install

```bash
npm install -g gitbook-cli
```

### Server

```bash
sh serve.sh
```

### Build

```bash
sh build.sh
```

### 文档维护流程

1. 本地编写文档请务必确认在 `src` 文件夹下编辑你的文档

2. 文档编写之前，先启用本地服务，他可以帮助你本地预览修改的文档内容。启用本地服务前，请确保安装了 `git`。找到文件 `serve.sh` 所在目录，右键启用 `git bash` 然后运行

`sh serve.sh`

默认本地会启动服务：http://localhost:4000 浏览器打开此链接即可

3. 编写完之后需要将编写的文档提交到远程服务器，首先需要运行

`sh build.sh` 这个命令，会将源文件编译到 `docs` 文件夹。

4. 使用 `git` 进行提交

* `git status` 可以查看本次修改的一些文件

* `git add -A` 提交所有的文件改动

* `git commit -m "some comments"` 引号内填写你自己的提交文字，用来记录每次改动的内容。比如你这次添加了 facebook 相关的文档。你的提交就可以这样写：

`git commit -m "add facebook file"`

* `git push origin master` 将文件提交到远程

**注意：提交前请确保运行了 `sh build.sh`**
