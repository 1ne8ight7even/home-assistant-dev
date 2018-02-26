FROM homeassistant/home-assistant:latest
LABEL maintainer="Florian Biebel <florian@biebel.io>"

RUN apt-get update \
  && apt-get install -y git \
  && cd /tmp && git clone https://github.com/OpenZWave/open-zwave.git && cd open-zwave && git checkout Dev \
  && make && make install \
  && ln -s /usr/local/lib64/libopenzwave.so /usr/lib/ \
  && ln -s /usr/local/lib64/libopenzwave.so.1.4 /usr/lib/ \
  && pip3 install --no-cache-dir python_openzwave==0.4.4 --upgrade --no-deps --force-reinstall --install-option="--flavor=shared"
