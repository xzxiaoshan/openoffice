# openoffice
OpenOffice 镜像

## 说明  
1. 默认安装目录在 `/opt/openoffice4` 
2. 容器启动后会自动执行 `/opt/openoffice4/program/soffice -headless -accept="socket,host=0.0.0.0,port=8100;urp;" -nofirststartwizard`  
3. 该镜像基础镜像为 `docker.io/xzxiaoshan/openoffice-base:latest`  
4. `openoffice-base` 的再上一个基础镜像为 `docker.io/store/oracle/serverjre:8` 所以，你可以 `xzxiaoshan/openoffice` 这个镜像作为你的Java服务的基础镜像来使用（比如你的Java服务里面使用jodconverter借助OpenOffice做文档转换工作等）  
