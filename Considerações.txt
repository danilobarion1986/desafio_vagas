
Design e Estrutura Básica
---------------------------
Estruturei a solução resumidamente da seguinte forma:

- Separação dos principais constituintes do problema (talks, sessions, brakes, tracks, etc) em classes bem definidas, e o mais específicas possíveis para uma 1ª versão.

- Estrutura que permite fácil evolução e refatoração.

- Algumas validações básicas que são usadas para verificar se as regras do problema estão sendo atendidas, conforme criam-se os objetos. Não abrangem todos os detalhes possíveis na 1ª versão, mas para um input "ideal" funcionam corretamente, impedindo o uso de talks inválidas.

- Testes básicos para o objeto Talk, que seriam semelhantes para os demais. Ainda é necessário a inclusão de mais testes das classes e métodos, além de testes de integração.


Execução
---------------------------
Conforme solicitado, basta navegar até a pasta do projeto e por meio do console rodar o comando abaixo:

> ruby main.rb input.txt > final_schedule.txt
O resultado então poderá ser visto no arquivo "final_schedule.txt", criado no diretório principal.


Melhorias
---------------------------
> Refatorar o arquivo 'main.rb' para que fique mais aderente ao DRY
> Refatorar a classe 'Utils' para que se torne um módulo contendo classes especificamente para validações, leitura de arquivos e outros parâmetros a serem aceitos pelo 'main.rb'
> Verificar exceções que podem ocorrer e refatorar para que sejam evitadas
	> Após isso, inserir raise's para tratar as exceções não previstas


Extras
---------------------------
O código pode ser avalido também no link abaixo
> https://github.com/danilobarion1986/desafio_vagas

A execução dos testes, para integração contínua, podem ser vistos aqui:
> https://travis-ci.org/danilobarion1986/desafio_vagas

