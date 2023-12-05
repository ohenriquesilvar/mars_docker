## Trabalho prático 2 ARQII

### Descrição:

Criar ambiente docker que permita a execução do MARS (MIPS Assembler and Runtime Simulator) e o desenvolvimento de programas em assembly MIPS.

Para configuração do container foram utilizados dois arquivos, sendo eles o Dockerfile e o compose.yaml. O primeiro é responsável por criar a imagem do container, baseado na imagem do Ubuntu 18.04 e instalar as dependências necessárias para a execução do MARS. Dessa forma, é feita a instalação do OpenJDK 8 e do wget, para download do MARS.

O segundo arquivo(`compose.yaml`) é responsável por criar o container, baseado na imagem criada pelo Dockerfile e passar as configurações necessárias para a execução do MARS. Dessa forma, é passado o comando para execução do MARS, a variável de ambiente para o display e o volume para compartilhamento de arquivos entre o container e a máquina host.

### Como executar:

Para executar o container, basta usar o comando `docker-compose up` no diretório onde se encontra o arquivo `compose.yaml`. Após a execução do comando, o container será criado e o MARS será executado. Caso queira executar o container em background, basta executar o comando `docker-compose up -d`.

Além disso, caso queira fazer o processo de build e execução manualmente, basta executar os seguintes comandos:

**Build**: `docker build -t mars_image .`

**Execução**: `docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name mars_docker mars_image`

### Arquivos:

Caso queira iniciar o container já com arquivos previamente salvos no host, basta colocar os arquivos na raiz deste diretório, e executar o comando `docker-compose up` ou `docker-compose up -d`.

**OBS**: Caso tenha adicionado os arquivos após a criação do container, é necessário rebuildar a imagem e executar o container novamente.

Para salvar os arquivos editados/criados no container na sua máquina host, é necessário usar o seguinte comando (COM O CONTAINER EM EXECUÇÃO!!!):

`docker cp mars_docker:/app/nome_arquivo.asm ./`

### Pré-requisitos:

- Docker instalado
- Docker compose instalado
- X Server instalado

### Ambiente de desenvolvimento:

- Linux Mint 21.2
