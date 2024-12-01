# Используем базовый образ Ubuntu
FROM ubuntu:24.04

# Настройки локализации
RUN apt-get update && apt-get install -y locales&& \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Настройки для tz
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y binutils wget git \
    cmake build-essential manpages-dev libopengl0 \
    gawk bison python3 software-properties-common




# Загрузка и сборка glibc
# RUN wget http://ftp.gnu.org/gnu/libc/glibc-2.32.tar.gz && \
#     tar -xvf glibc-2.32.tar.gz && \
#     cd glibc-2.32 && \
#     mkdir build && cd build && \
#     ../configure --prefix=/opt/glibc-2.34 && \
#     make -j$(nproc) && make install

# Добавление новой версии glibc в PATH
#ENV LD_LIBRARY_PATH=/opt/glibc-2.34/lib:$LD_LIBRARY_PATH

# Установка более новой версии GCC
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get update && apt-get install -y gcc-11 g++-11 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 60



RUN apt-get update

# Установка необходимых пакетов
RUN add-apt-repository 'ppa:deadsnakes/ppa'
RUN apt-get update && \
    apt-get install -y \
    libqt5x11extras5-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools 
RUN apt-get install -y curl python3.10 python3.10-dev python3.10-distutils pybind11-dev libpython3-dev \
    tzdata unzip x11-apps xorg openbox && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# Установка pip и необходимых Python пакетов
RUN curl -L https://bootstrap.pypa.io/pip/get-pip.py --output /tmp/get-pip3.py
RUN python3.10 /tmp/get-pip3.py
RUN python3.10 -m pip install --upgrade pip
RUN python3.10 -m pip install numpy scipy pybind11==2.9.1

ENV DISPLAY host.docker.internal:0.0

# Создание каталога и загрузка файла SOFA
RUN mkdir sofa && \
    cd sofa && \
    wget https://github.com/sofa-framework/sofa/releases/download/v24.06.00/SOFA_v24.06.00_Linux.run && \
    chmod +x SOFA_v24.06.00_Linux.run && \
    ./SOFA_v24.06.00_Linux.run || true


# Запуск контейнера в интерактивном режиме с шеллом
CMD ["./root/SOFA/v24.06.00/bin/runSofa"]
