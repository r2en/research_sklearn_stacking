FROM gcr.io/gcp-runtimes/ubuntu_16_0_4:latest

ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y libssl-dev\
    && apt-get install -y libffi-dev\
    && apt-get install -y libxml2-dev\
    && apt-get install -y libxslt1-dev\
    && apt-get install -y cmake\
    && apt-get install -y gcc\
    && apt-get install -y g++\
    && apt-get install -y build-essential\
    && apt-get install -y ca-certificates\
    && apt-get install -y git\
    && apt-get install -y vim\
    && apt-get install -y sudo\
    && apt-get install -y make\
    && apt-get install -y curl\
    && apt-get install -y xz-utils\
    && apt-get install -y file\
    && apt-get install -y unzip\
    && apt-get install -y sudo\
    && apt-get install -y wget\
    && apt-get install -y mecab libmecab-dev mecab-ipadic-utf8\
    && apt-get install -y fonts-ipaexfont\
    && apt-get install -y --no-install-recommends \
    && apt-get install -y software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 python3.7-dev\
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.7 ./get-pip.py \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.7 /usr/local/bin/python

RUN git clone --recursive --branch stable --depth 1 https://github.com/Microsoft/LightGBM && \
    mkdir LightGBM/build && \
    cd LightGBM/build && \
    cmake .. && \
    make -j4 && \
    make install && \
    cd ../.. && \
    rm -rf LightGBM

WORKDIR /root/user

COPY requirements.txt /root/user

RUN pip install pip setuptools -U && pip install -r requirements.txt

#CMD ["python", "app.py"]