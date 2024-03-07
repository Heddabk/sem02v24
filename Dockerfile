FROM ubuntu:24.04
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git
RUN useradd -G sudo -m -d /home/Heddabk -s /bin/bash -p "$(openssl
passwd -1 1234)" Heddabk
USER Heddabk
WORKDIR /home/Heddabk
RUN mkdir hacking \
&& cd hacking \
&& curl -SL
https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v2
4/pawned.sh > pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..
RUN git config --global user.email "heddakjeld@gmail.com"
\
&& git config --global user.name "Heddabk" \
&& git config --global url."https://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:@github.com/".insteadOf
"https://github.com" \
&& mkdir -p github.com/Heddabk
USER root
RUN curl -SL https://go.dev/dl/go1.21.7.OS-ARCH.tar.gz \
| tar xvz -C /usr/local
USER Heddabk
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Heddabk/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"
