# Sistema Coordinador 360
Para iniciar el proyecto SC360 se necesita agregar el proxy
de QG 192.168.40.35:3128 y empezar a clonar el repositorio


##git config --global http.proxy address:port

git config --global http.proxy 192.168.40.35:3128 

##git -c "http.proxy=address:port" clone https://...

git -c "http.proxy=192.168.40.35:3128" clone https://github.com/luizgrc/sc360.git

##alias git-proxy='git -c "http.proxy=address:port"'
Opcional