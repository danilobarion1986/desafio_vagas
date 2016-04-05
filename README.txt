
Design e Estrutura B�sica
---------------------------
Estruturei a solu��o resumidamente da seguinte forma:

- Separa��o dos principais constituintes do problema (talks, sessions, brakes, tracks, etc) em classes bem definidas, e o mais espec�ficas poss�veis para uma 1� vers�o.

- Estrutura que permite f�cil evolu��o e refatora��o.

- Algumas valida��es b�sicas que s�o usadas para verificar se as regras do problema est�o sendo atendidas, conforme criam-se os objetos. N�o abrangem todos os detalhes poss�veis na 1� vers�o, mas para um input "ideal" funcionam corretamente, impedindo o uso de talks inv�lidas.

- Testes b�sicos para o objeto Talk, que seriam semelhantes para os demais. Ainda � necess�rio a inclus�o de mais testes das classes e m�todos, al�m de testes de integra��o.


Execu��o
---------------------------
Conforme solicitado, basta navegar at� a pasta do projeto e por meio do console rodar o comando abaixo:

> ruby main.rb input.txt > final_schedule.txt
O resultado ent�o poder� ser visto no arquivo "final_schedule.txt", criado no diret�rio principal.


Melhorias
---------------------------
> Refatorar o arquivo 'main.rb' para que fique mais aderente ao DRY
> Refatorar a classe 'Utils' para que se torne um m�dulo contendo classes especificamente para valida��es, leitura de arquivos e outros par�metros a serem aceitos pelo 'main.rb'
> Verificar exce��es que podem ocorrer e refatorar para que sejam evitadas
	> Ap�s isso, inserir raise's para tratar as exce��es n�o previstas


Extras
---------------------------
O c�digo pode ser avalido tamb�m no link abaixo
> https://github.com/danilobarion1986/desafio_vagas

A execu��o dos testes, para integra��o cont�nua, podem ser vistos aqui:
> https://travis-ci.org/danilobarion1986/desafio_vagas

