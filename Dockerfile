From resin/rpi-raspbian

ARG NODE_VER
ADD ./src/${NODE_VER:-node-v5.9.1-linux-armv7l} /

RUN ln -s /${NODE_VER} /node
ENV PATH=/node/bin:$PATH

CMD ["node"]
