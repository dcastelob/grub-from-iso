# grub-from-iso
## Objetivo

Permitir a inclusão de uma imagem no boot do grub. Isso permite acessar um sistema `live` em diversas sistuações, como recuperação de ambiente onde o grub consegue inicializar o menu, mas pode estar com algum problema na partição boot.

O Projeto consiste nos seguinte componentes:
|Componente | Descrição |
|-----------|-----------|
|`/etc/default/grub-from-iso.conf`| Configuração gerais da ISO|
| `/etc/grub.d/99_grub_from_iso` |Script para o grub, responsável por criar a entrada no grub  para boot pela ISO|
|`/boot/grub/grub-for-iso.cfg` |Arquivo gerado automaticamente, contendo a entrada de menu para inicializar a ISO.|
|`/usr/local/bin/get-dsl-rescue-iso.sh`|Script que faz o download das distro `Damn Small Linux`, uma distro leve que é configurada inicialmente no menu do grub.|

## Instalação
```bash 
git clone <url_projeto>
cd grub-from-iso
make install
```

## Remoção
```bash 
cd grub-from-iso
make uninstall
```
## Download do Damn Small Linux
```bash 
cd grub-from-iso
make get-dsl
```


## Notas técnicas
* até o momento, evite armazenar as imagens ISO em volumes brtfs. 