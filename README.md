# COMO RODAR

## 1- Clone o repositório
``` git clone https://github.com/emanuelsds/back-end-ribon.git ```

## 2- Execute os seguinte comandos no terminal(antes de executar configure o database.yml com o usuário e senha do DB)
``` cd back-end-ribon ```

``` rails db:create db:migrate && rake initialize:monsters ```

## 3- Inicie o servidor rails
``` rails s ```

## 4- Vá para o navegador e entre na URL
``` localhost:3000 ```
