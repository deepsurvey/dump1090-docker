FROM python:3.9.18-bullseye as builder

RUN apt update && \
    apt install -y \
      pkg-config && \
    rm -rf /var/lib/apt/lists/*

FROM python:3.9.18-bullseye

RUN apt update && \
    apt install -y &&\
    rm -rf /var/lib/apt/lists/*

#RUN pip install adsbcot[with_pymodes] pyrtlsdr cryptography
RUN pip install --upgrade pymodes==2.11
RUN pip install adsbcot pyrtlsdr cryptography
#RUN adsbcot --help &
#RUN adsbcot -B udp://239.2.3.1:6969 -D tcp+beast:127.0.0.1:30005 &
#ENTRYPOINT ["/run.sh"]
COPY start.sh /
COPY config.ini /etc/adsbcot.ini
RUN mkdir /run/dump1090-fa
RUN chmod +x /start.sh 
ENTRYPOINT ["/start.sh"]
