FROM docker.io/xzxiaoshan/openoffice-base:latest

MAINTAINER 365384722@qq.com

WORKDIR /opt/

RUN set -x && \
  wget -O openoffice.tar.gz https://udomain.dl.sourceforge.net/project/openofficeorg.mirror/4.1.9/binaries/zh-CN/Apache_OpenOffice_4.1.9_Linux_x86-64_install-rpm_zh-CN.tar.gz && \
  tar -xzvf openoffice.tar.gz && \
  cd zh-CN/RPMS/ && \
  rpm -ivh *.rpm && \
  rpm -ivh desktop-integration/*redhat*.rpm

EXPOSE 8100

CMD ['/opt/openoffice4/program/soffice', '-headless', '-accept="socket,host=127.0.0.1,port=8100;urp;"', '-nofirststartwizard']
