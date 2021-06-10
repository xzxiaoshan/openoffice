FROM docker.io/xzxiaoshan/openoffice-base:latest

MAINTAINER 365384722@qq.com

WORKDIR /opt/

COPY ./fonts/* /usr/share/fonts/

RUN set -x && \
  mkfontscale && mkfontdir && fc-cache -fv && fc-list && \
  wget -O openoffice.tar.gz https://udomain.dl.sourceforge.net/project/openofficeorg.mirror/4.1.9/binaries/zh-CN/Apache_OpenOffice_4.1.9_Linux_x86-64_install-rpm_zh-CN.tar.gz && \
  tar -xzvf openoffice.tar.gz && \
  cd zh-CN/RPMS/ && \
  rpm -ivh *.rpm && \
  rpm -ivh desktop-integration/*redhat*.rpm && \
  cd /opt/ && \
  rm -rf openoffice.tar.gz && \
  rm -rf zh-CN/RPMS && \
  echo "#!/bin/bash" > entrypoint.sh && \
  echo "exec /opt/openoffice4/program/soffice -headless -accept=\"socket,host=0.0.0.0,port=8100;urp;\" -nofirststartwizard" >> entrypoint.sh && \
  chmod +x entrypoint.sh

EXPOSE 8100

ENTRYPOINT ["./entrypoint.sh"]
