FROM gitpod/workspace-full
RUN sudo apt-get install build-essential libreadline-dev zlib1g-dev flex bison
RUN git clone https://github.com/bitnine-oss/agensgraph.git
WORKDIR /agensgraph
RUN echo $(pwd)