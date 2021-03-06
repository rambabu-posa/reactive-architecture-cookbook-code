FROM ubuntu:16.04

RUN NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5 && \
    NVIDIA_GPGKEY_FPR=ae09fe4bbd223a84b2ccfce3f60f4b3d7fa2af80 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
    apt-key adv --export --no-emit-version -a $NVIDIA_GPGKEY_FPR | tail -n +5 > cudasign.pub && \
    echo "$NVIDIA_GPGKEY_SUM  cudasign.pub" | sha256sum -c --strict - && rm cudasign.pub && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list

ENV CUDA_VERSION 8.0

ENV CUDA_PKG_VERSION 8-0=8.0.44-1

# cuda-core-$CUDA_PKG_VERSION \
# cuda-misc-headers-$CUDA_PKG_VERSION \
# cuda-command-line-tools-$CUDA_PKG_VERSION \
# cuda-nvrtc-dev-$CUDA_PKG_VERSION \
# cuda-nvml-dev-$CUDA_PKG_VERSION \
# cuda-nvgraph-dev-$CUDA_PKG_VERSION \
# cuda-cusolver-dev-$CUDA_PKG_VERSION \
# cuda-cublas-dev-$CUDA_PKG_VERSION \
# cuda-cufft-dev-$CUDA_PKG_VERSION \
# cuda-curand-dev-$CUDA_PKG_VERSION \
# cuda-cusparse-dev-$CUDA_PKG_VERSION \
# cuda-npp-dev-$CUDA_PKG_VERSION \
# cuda-cudart-dev-$CUDA_PKG_VERSION \
# cuda-driver-dev-$CUDA_PKG_VERSION \
# cuda-nvrtc-$CUDA_PKG_VERSION \
# cuda-nvgraph-$CUDA_PKG_VERSION \
# cuda-cusolver-$CUDA_PKG_VERSION \
# cuda-cublas-$CUDA_PKG_VERSION \
# cuda-cufft-$CUDA_PKG_VERSION \
# cuda-curand-$CUDA_PKG_VERSION \
# cuda-cusparse-$CUDA_PKG_VERSION \
# cuda-npp-$CUDA_PKG_VERSION \
# cuda-cudart-$CUDA_PKG_VERSION \

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        libsnappy-dev \
        libssl-dev \
        libboost-all-dev \
        ca-certificates \
        openssl \
        curl \
        unzip \
        automake \
        libtool \
        build-essential \
        git \
        gcc \
        g++ \
        cmake \
        && \
    ln -s cuda-$CUDA_VERSION /usr/local/cuda && \
    rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/nghttp2/nghttp2 && \
#     cd nghttp2 && \
#     mkdir x && \
#     cd x && \
#     cmake -DENABLE_ASIO_LIB=ON .. && \
#     make install -j8 && \
#     rm -rf nghttp2 && \
#     cd / && \
#     ln -s /usr/local/libnghttp2.so /usr/lib/x86_64-linux-gnu/libnghttp2.so

RUN git clone https://github.com/google/protobuf && \
    cd protobuf && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make -j8 install && \
    cd / && \
    rm -rf protobuf && \
    ln -s /usr/lib/libprotobuf.so /usr/lib/x86_64-linux-gnu/libprotobuf.so

RUN git clone https://github.com/edenhill/librdkafka && \
    cd librdkafka && \
    ./configure --prefix=/usr && \
    make -j8 && \
    make install && \
    cd / && \
    rm -rf librdkafka && \
    ln -s /usr/lib/librdkafka.so /usr/lib/x86_64-linux-gnu/librdkafka.so && \
    ln -s /usr/lib/librdkafka++.so /usr/lib/x86_64-linux-gnu/librdkafka++.so

RUN curl -L -o opencv3.zip https://github.com/opencv/opencv/archive/3.2.0.zip && \
    unzip opencv3.zip && \
    rm opencv3.zip

RUN cd opencv-3.2.0 && \
    mkdir x && \
    cd x && \
    cmake .. && \
    make -j8 install && \
    cd / && \
    rm -rf opencv-3.2.0

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf && \
    ldconfig

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

ADD run.sh /usr/bin/run.sh
