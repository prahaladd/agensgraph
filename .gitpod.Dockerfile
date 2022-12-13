FROM gitpod/workspace-full
RUN sudo apt-get install -y build-essential libreadline-dev zlib1g-dev flex bison
RUN git clone --progress --verbose https://github.com/bitnine-oss/agensgraph.git
WORKDIR /home/gitpod/agensgraph
RUN echo "Building AgensGraph in $(pwd)"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
RUN sudo mkdir -p /var/graphdb && sudo chown -R gitpod:gitpod /var/graphdb \
        && ./configure \
        && sudo make install \
        && echo "export AGDATA=/var/graphdb" >> ~/.bashrc \
        && echo "export PATH=$PATH:/usr/local/pgsql/bin" >> ~/.bashrc \
        && echo "AgensGraph install complete..."