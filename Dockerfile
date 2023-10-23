# 使用ubuntu作为基础镜像
FROM ubuntu:22.04

# 设置中文显示支持
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai

# 中文字体
COPY SimHei.ttf /root

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip git -y \
    && apt-get -y install pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic \
        latex-cjk-all -y \
    && pip config --user set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install \
        jupyterlab jupyterlab-language-pack-zh-CN jupyterlab-git jupyterlab-github \
        matplotlib \
        numpy \
        sympy \
    && mkdir /usr/share/fonts/simhei && mv /root/SimHei.ttf /usr/share/fonts/simhei/

RUN apt-get install -y curl

WORKDIR /root/notebook

EXPOSE 8888

CMD ["jupyter","lab","--allow-root","--ip","0.0.0.0,"--no-browser"]
