#基础镜像，如果本地没有，会从远程仓库拉取。
#FROM openjdk:8-jdk-slim
FROM docker.io/store/oracle/serverjre:8

#镜像的制作人
MAINTAINER 365384722@qq.com

#工作目录
WORKDIR /opt/

#filebeat.inputs.enabled 默认为false，切记改为 true 否则坑
#Array of hosts to connect to. hosts是string数组类型，支持多个kafka实力地址(此处不是配置zookeeper地址)
RUN set -x && \
  yum -y install libXext && \
  yum -y install fontconfig && \
  yum -y groupinstall "X Window System" && \
  yum -y install wget && \
  wget -O openoffice.tar.gz https://udomain.dl.sourceforge.net/project/openofficeorg.mirror/4.1.9/binaries/zh-CN/Apache_OpenOffice_4.1.9_Linux_x86-64_install-rpm_zh-CN.tar.gz && \
  tar -xzvf openoffice.tar.gz && \
  cd zh-CN/RPMS/
  #&& \
#  rpm -ivh *.rpm && \
#  rpm -ivh desktop-integration/*redhat*.rpm

#声明了容器应该打开的端口并没有实际上将它打开
EXPOSE 8100

#CMD ['/opt/openoffice4/program/soffice', '-headless', '-accept="socket,host=127.0.0.1,port=8100;urp;"', '-nofirststartwizard']
