# 使用nvidia作为基础镜像
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

# 设置时区
ENV TZ=Asia/Shanghai

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install python3 pip git -y \
    && apt-get -y install pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic \
        latex-cjk-all git-lfs -y \
    && pip config --user set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install \
        jupyterlab jupyterlab-language-pack-zh-CN jupyterlab-git jupyterlab-github \
        matplotlib \
        numpy \
        sympy \
        mplfonts

# 安装额外的工具
RUN apt-get install -y \
    curl \
    nano

# 初始化中文字体库
RUN mplfonts init

# pytorch
RUN pip3 install torch torchvision torchaudio

# 大语言相关库
RUN pip3 install \
    transformers \
    sentencepiece

# # 设置 git
# RUN git config --global user.email "you@example.com" \
#     && git config --global user.name "Your Name"

# 设置 ssh key
RUN ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -P ""

WORKDIR /root/notebook

EXPOSE 8888

CMD ["jupyter","lab","--allow-root","--ip","0.0.0.0","--no-browser"]
