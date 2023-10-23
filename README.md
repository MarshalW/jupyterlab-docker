# JupyterLab docker

自定义 JupyterLab docker 镜像。

部署在远程服务器，要求:

- 可以通过 vscode remote 访问服务器
- 服务器已经安装了 docker

通过 vscode remote 进入该服务器，执行命令：

```bash
git clone https://github.com/MarshalW/jupyterlab-docker.git
cd jupyterlab-docker

# 第一次启动会构建 docker image
docker compose up -d

docker compose logs -f
..
jupyterlab  | [I 2023-10-23 15:03:49.725 ServerApp] Jupyter Server 2.8.0 is running at:
jupyterlab  | [I 2023-10-23 15:03:49.725 ServerApp] http://33dffc24af44:8888/lab?token=e75bbd6dc03597092c6f2a671d8336e0cef97d8870c30e25
jupyterlab  | [I 2023-10-23 15:03:49.725 ServerApp]     http://127.0.0.1:8888/lab?token=e75bbd6dc03597092c6f2a671d8336e0cef97d8870c30e25
jupyterlab  | [I 2023-10-23 15:03:49.725 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
jupyterlab  | [W 2023-10-23 15:03:49.728 ServerApp] No web browser found: Error('could not locate runnable browser').
jupyterlab  | [C 2023-10-23 15:03:49.728 ServerApp]
..
```

浏览器访问：http://127.0.0.1:8888/lab?token=e75bbd6dc03597092c6f2a671d8336e0cef97d8870c30e25

![](./JupyterLab__auto-V_.png)

