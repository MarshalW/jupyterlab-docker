# JupyterLab docker

自定义 JupyterLab docker 镜像。

```bash
# build image
docker build -t jupyterlab .

# run container
# jupyter lab --allow-root
docker run -it -p 0.0.0.0:8888:8888 --name=jupyterlab --rm jupyterlab bash
docker run -it --name=jupyterlab --rm jupyterlab bash
```
