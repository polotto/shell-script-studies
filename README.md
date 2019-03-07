# shell-script-studies 
Comandos principais do shell script

# Principais comandos
## cd - navegar entre os diretórios
* `cd ..` ou `cd ../../Downloads` : subir de nivel
* `cd -` : volta para o anterior
* `cd` ou `cd ~` : vai para home

## ls - listar os diretórios
* `ls -ltr` : ordena do mais velho para o mais novo
* `ls -l` : lista arquivos com permissões
* `ls -1` : lista sem detalhes

## ps - lista processos atuais
* `ps axu` : lista de processos detalhados
* pcaxu|more` : lista com cabeçalho

## touch - criar arquivo ou atualizar horário de um que já existe

## man ou --help - mostrar lista de opções

## echo - mostra um texto na saída
* `echo -n "text"` : não quebra linha
* `echo -e "text\ttext2\n" : inclui comando especiais

## mkdir - cria um diretório
* `mkdir diretorio1` : cria um diretório
* `mkdir -p diretorio1/exercicio1` : cria um diretório e um sub-diretório

## rm - remove arquivos
* `rm arquivo` : remove arquivo
* `rm -r diretorio` : remove diretório com sub-diretórios e arquivos
* `rm -f arquivo` : remove o arquivo sem retornar messagens de alerta

## sleep - espera um tempo
* `sleep 5` : espera 5 segundos

## cat - retorna o conteúdo de um arquivo
* `cat arquivo` : mostra conteúdo do arquivo
* `cat -b arquivo` : mostra com somente as linhas com texto enumeradas
* `cat -n arquico` : mostra com todas as linhas enumeradas inclusive as brancas
* `cat -A arquivo` : mostra incluindo os caracteres especiais

## tac - mostra o conteúdo o arquivo de trás para frente
* `tac arquivo` : mostra todo o conteúdo do arquivo de trás para frente

## tail - mostra somente as últimas 10 linhas  do arquivo
* `tail -n2 arquivo` : mostra somente as 2 últimas linhas
* `tail -f arquivo` : monitora por mudanças as últimas 10 linhas do arquivo até que seja interrompido (follow)

## head - mostra as primeiras 10 linhas do arquivo
* `head -n2 arquivo` : mostra somente as 2 primeiras linhas
* `head -c10 arquivo` : mostra os 10 primeiros caracteres

## wc - conta os linhas, palavras, caracteres
* `wc arquivo` : mostra as linhas, palabras e caracteres
* `wc -l arquivo` : mostra o número de linhas
* `wc -w arquivo` : mostra o número de palavras
* `wc -m arquivo` : mostra o número de caracteres
* `wc -c arquivo` : mostra o número de bytes
* `wc alunos*` : executa o comando para todos os arquivos que começam com alunos
* `tail -n5 arquivos|wc -w` : usa a saído do tail e envia ela para o wc para contar as plavras

## sort - ordena um arquivo
* `sort arquivo` : ordena um arquivo
* `sort -r arquivo` : ordena um arquivo de forma decrescente
* `sort -k2 arquivo` : altera o índice de ordenação para o segundo
* `tail /etc/passwd| sort -k3 -t":"` : altera o delimitador para `:` e ordena pelo 3 campo
* `tail /etc/passwd| sort -k3 -t":" -g` : altera o delimitador para `:` e ordena pelo 3 campo considerando numérico

## uniq - mostra somente a primeira ocorrência da palavra no arquivo
* `uniq arquivo` - mostra somente a primeira ocorrência da palavra na sequência, não considera repetidos que não estão na sequência
* `sort arquivo| uniq` - mostra somente uma única vez as ocorrências após ordenar
* `sort arquivo| uniq -u` - mostra somente as ocorrências únicas
* `sort arquivo| uniq -d` - mostra somente as ocorrências duplicadas
* `sort arquivo| uniq -c` - conta as repetições
* `sort arquivo| uniq -c| sort` - conta as repetições e as ordena da menor para maior
* `sort arquivo| uniq -c| sort -r` - conta as repetições e as ordena da maior para menor
* `sort arquivo| uniq -c| sort -r | head -n1` - mostra somente a ocorência que aconteceu mais

## whatis - mostra o que esse comando faz
* `whatis tr` : mostra a função do tr

## whereis - mostra o caminho a localização em disco do comando
* `whereis date` : mostra onde está o date em disco

## tr - troca um ou mais caracteres
* `cat arquivo| tr a e` : troca toda ocorência de `a` por `e`
* `cat arquivo| tr a-z A-Z` : troca toda letra minúscula por maiúscula
* `cat arquivo| tr aei AEI` : troca `aei` por `AEI`
* `cat arquivo| tr ' ' '\t'` : troca espaço por tab
* `cat arquivo| tr -d aei` : remove as letras `aei`
* `echo "Curso Shell Script"| tr -s 'l'` : comprime o `l` para aparecer somente uma vez
* `echo "curso de shell script"| tr [:lower:] [:upper:]` : converte as letras minúsculas para maiúculas

## cut - recorta somente alguns caracters para cada linha
* `cat arquivo| cut -c1-5` : mostra somente dos caracters de 1 a 5 de cada linha do arquivo
* `cat arquivo| cut -c1,2,5` : mostra somente os caracters 1, 2 e 5 de cada linha
* `cat arquivo| cut -c5-` : a partir do caractere 5
* `cat arquivo| cut -c-5` : até o caractere 5
* `cat arquivo| cut -c1,2,10-` : caractere 1, 2 e a partir do 10
* `cat arquivo| cut -d" " -f1` : mostra somente o primeiro campo onde a delimitação é espaço
* `cat arquivo| cut -d" " -f1,3` : mostra somente o primeiro e o terceiro compo com delimitação de espaço

## diff - compara os arquivos
* `diff arquivo1 arquivo2` : mostra a diferença entre os arquivos
* `diff arquivo1 arquivo2| cat -A` : mostra a diferença incluindo os caracteres especiais
* `diff -w arquivo1 arquivo2` : mostra a diferença desconsiderando os espaços em branco
* `diff -r dir1 dir2` : mostra a diferença entre diretórios
 
## grep - procura algo em uma saída
* `grep NOME arquivo` : procura pelo NOME no arquivo
* `grep NOME arquivo*` : procura pelo NOME em todos os arquivos que começam com arquivo*
* `grep "NOME COMPLETO" arquivo` : procura pela string entre aspas
* `grep -i NOME arquivo` : procura pelo NOME desconsiderando maiúsculas e minúsculas
* `grep -c NOME arquivo` : conta quantas vezes encontrou NOME
* `grep -v NOME arquivo` : não mostra a linha onde aparece o NOME, somente outras linhas
* `grep -r NOME *` : procura por NOME dentro de todos os arquivos dentro de todos os subdiretórios relativos ao caminho atual
* `grep -rl NOME *` : procura por NOME dentro de todos os arquivos e mostra somente o caminho do arquivo
* `cat arquivo| grep NOME` : procura por nome no arquivo
* `grep -A3 NOME arquivo` : procura por NOME e mostra 3 linhas após a ocorrência do NOME
* `grep -B3 NOME arquivo` : procura por NOME e mostra 3 linhas antes da ocorrência do NOME
* `fgrep` : não aceita expressões regulares
* `egrep` : aceita expressões regulares extendidas

## sed - filtra e transforma as entradas
* `sed '1,3 d' arquivo` : não mostra as linhas 1 e 3
* `sed '/Rafael/d' arquivo` : não mostra as linhas onde aparece Rafael
* `cat arquivo| sed 's/Paulo/Joao/'` : substitui Paulo por Joao na primeira ocorrência
* `echo 'Curso Linux Shell Script Linux'| sed 's/Linux/Unix/g` : substitui todas as ocorrências de Linux por Unix

## more - mostra uma o conteúdo do arquivo de forma paginada, ENTER pula linha ESPAÇO muda página
* `more arquivo` : mostra o conteúdo de maneira paginada

## less - mostra o conteúdo do arquivo de forma paginada mas com mais opções: ENTER, ESPAÇO, SETAS
* `less arquivo` : para pesquisa, /, n para navegar e ? para procura de baixo para cima
* `cat -A arquivo| less` : pega o conteúdo do arquivo e pagina com less
* `cat -A arquivo| grep a| less` : mostra toda linha onde aparece a letra a de forma paginada

## find - procura por arquivos
* `find ./ -name alunos` : procura por um arquivo com o nome alunos
* `find ./ -name *copia*` : procura por que contenha no nome copia
* `find ./ -user ricardo -name alunos` - procura por arquivo chamado alunos do usuário ricardo
* `find ./ -name alunos* -exec ls -l {} \;` - aplica o comando ls -a para cada resultado da busca

## date - mostra a data do sistema
* `date +%d/m` : mostra somente a data com dia e mês

## seq - mostra uma sequência de números
* `seq 20` : inicia do 1 ao 20
* `seq 5 12` : inicia em 5 e termina em 12
* `seq 0 5 30` : inicia em 0 e vai até o 30 de 5 em 5

## expr - comando para fazer contas
* `expr 5 + 2` : faz 5 + 2
* `expr 5 \* 2` : faz 5 * 2

## bc - executa contas em uma string
* `echo "(3 + 2) * 5"| bc` : resolve a expressão dentro do echo
* `bc <<< "scale=2; 100/3"` : resolve a expressão dentro das aspas e retorna 33.33 (https://stackoverflow.com/questions/12722095/how-do-i-use-floating-point-division-in-bash/28541396)

## stat - mostra informações do arquivo na partição atual
* `stat alunos.txt` : mostra informações para o arquivo alunos.txt

# Agrupamento de comandos no shell

## | - saida do primeiro é colocado na entrada do próximo
* `cat alunos.txt| wc -l` : conta o número de linhas do arquivo alunos.txt

## ; - comando em sequência, se falhar o primeiro, continua a execução
* `date ; echo linux ; ls` : executa em sequência os comandos

## && - comando em sequência, somente se continua se o anterior for executado com sucesso
* `ls alunos.txt && echo linux` : somente executa o segundo se o primeiro terminar com sucesso

## || - somente executa o segundo se o primeiro comando falhar
* `ls alunos.txt || echo linux` : somente executa o segundo se o primeiro falhar

## () - isola os comandos dentro de um sub shell, nada é alterado na sessão atual
* `(cd .. ; ls -l)` : executa o ls na pasta anterior se mudar o caminho atual

# Redirecionamento de comandos

## > - redireciona a saída padrão (stdout 1) para um novo arquivo, caso exista, sobre-escreve
* `cat alunos.txt > alunos-temp.txt` : cria ou sobre-escreve a saída do cat no arquivo alunos-temp.txt

## >> - redireciona a saída padrão (stdout 1) mas concatena com o conteúdo já existente no arquivo
* `date >> aluons-temp.txt` : concatena ao final do arquivo alunos-temp.txt

## 2> - redireciona a saída de erro (stdout 2) para um arquivo
* `ls -l alunos.txt2 2> log.out` : redireciona a saída de erro para um arquivo

## 2>> - rediciona a saída de erro (stdout 2) mas contatena com o conteúdo já existente no arquivo
* `ls -l alunos.txt2 2>> log.out` : contatena ao final do arquivo a saída de erro

## juntando os comandos
* `ls -l alunos.txt > log.out 2> log-erro.out` : caso dê certo, coloca a saída em log.out, caso dê erro, coloca a saída em log-erro.out
* `ls -l alunos.txt > log.out 2> &1` : coloca as duas saídas no mesmo arquivo
* `ls -l alunos.txt >> log.out 2> &1` : coloca as duas saídas no mesmo arquivo concatenando com o conteúdo existente

## /dev/null - lança a saída para o nada, buraco negro do linux
* `ls -l alunos.txt 2> /dev/null` : caso dê erro, não mostra e não salva em lugar nenhum

## < - redireciona a entrada
* `tr 'a' 'Z' < alunos.txt` : rediciona o conteúdo do arquivo alunos.txt para o comando tr

# variáveis
## env - mostra as variáveis de ambiente exportadas da sessão
* `env`

## set - mostra as variáveis de ambiente exportadas e locais da sessão
* `set`

## declaração de variáveis
* `VARIAVEL1=valor` : cria uma variável
* `CURSO="curso de shell script"` : conteúdo com caracteres especiais

## mostrar variáveis
* `echo $VARIAVEL1` : mostra a variável na saída

## variáveis especiais
* `$$` : PID do shell atual
* `$0` ou `$SHELL` : mostra o tipo do shell que está sendo executado

## exportar variáveis para processos filhos
```
echo $$ # mostra o PID do bash atual
TESTE=Curso # cria a variável
export TESTE # exporta a variável para outros sub-processos
bash # cria uma nova sessão do bash
echo $$ # confirma q está em outro bash
echo $TESTE # mostra q tem acesso a variável TESTE
exit # sai do sub bash
export VAR1=teste # exporta e cria a variável
```

## atribuido valores a variáveis
* `HORA=`date +%H`` : atribui o valor do comando à variável
* `MINUTO=$(date +%M)` : atribui o valor do comando à variável

# Aspas no Shell
## " - protege todas os caracteres menos $, / e `
`echo "var $VAR"` : mostra o conteúdo das variável concatena com a string

## ' - protege todos os caracteres
`echo 'var $VAR'` : não mostra o conteúdo da variável

## \ - escape de caracteres especiais
* `echo cuso     shell` : o shell suprime os espaços
* `echo curo\ \ \ shell` : o shell adiciona espaços
* `echo \*` : mostra o *
* `echo *` : mostra todos os itens do diretório atual

# Comandos Vi
* `:1` : primeira linha
* `:$` : última linha
* `:!ls /tmp` : executa o ls e depois retorna ao VI
* `/Linux` : procura Linux no arquivo de cima para baixo, navega com `n`
* `?Linux` : procura Linux de baixo para cima
* `dd` : recorta uma linha
* `d4d` : recorta 4 linhas
* `p` : cola a linha
* `yy` : copia uma linha
* `y5y` : copia 5 linhas
* `w` : salva o arquivo
* `wq` : sai e salva
* `q!` : força a saída
* `0` : vai para o início da linha
* `$` : vai para o final da linha

# File globbing
## * - funciona para selecionar um nome genérico, pode ter um ou mais caracteres após
* `ls -l AULA*` : aplica ls -l para qualquer arquivo que possui um nome que inicia com AULA

## [] - delimita a seleção para somente uma lista caracteres
* `ls -l AULA[123]` : somente retorna os nomes que iniciam com AULA1, AULA2 e AULA3
* `ls -l Aul[Aa][1-3]` : somente aquivos com Aula* ou AulA* que terminam com 1, 2 ou 3

## {} - delimita a seleção um grupo de strings
* `ls -l {Aula,AULA}3` : procura por Aula3 e por AULA3

## ? - delimita para somente um caractere qualquer
* `ls -l Aula?` : procura por Aula seguido de somente um caractere
* `ls -l Aula??` : procura por Aula seguido de 2 caracteres

# Expressões regulares
## [] - delimita um grupo de caracteres
* `egrep "b[aei]g" texto.txt` : probura por bag, beg e big

## ˆ - marcação de início
* `egrep "ˆLinux" texto.txt` : toda linha que comece com Linux

## $ - marcação de final de linha
* `egrep "Linux$" texto.txt` : toda linha que termine com Linux
* `egrep "ˆ$" texto.txt` : mostra todas as linhas em branco
* `egrep -v "ˆ$" texto.txt` : não mostra as linhas em branco

## * - o caractere anterior deve ocorrer nenuma, uma ou várias vezes
* `egrep "b[a-i]g*" texto.txt` : a letra g pode aparecer nenhumo, uma ou várias vezes

## + - o caractere anterior deve ocorrer uma ou mais vezes 
* `egrep "b[a-i]g+" texto.txt` : a letra g deve aparecer uma ou mais vezes

## ? - o caractere anterior pode aparecer nenhuma ou apenas uma vez
* `egrep "b[a-i]g?" texto.txt` : a letra g pode aparecer nenuma ou apenas uma vez

## . - representa um caractere qualquer na expressão
* `egrep "O.Linux" texto.txt` : procura por frases com qualquer caractere entre O e Linux
* `egrep "O.*Linux" texto.txt` : procura por frases que tenha O seguido de qualquer coisa e Linux, considera também OLinux

## \ - protege o carctere para ele não fazer parte da expressão regular
* `egrep "[Ll]inux\." texto.txt` : interpreta o . como um caractere e não como parte da expressão: linux.com seria selecionado

# Executando um script
## #! (shebang) - especifica um interpretador para o script
* `#!/bin/bash` : especifica para utilizar o bash como interpretador do script atual

## chmod - modifica as permissões do arquivo
* `chmod +x script.sh` : adiciona permissão de execução para todos os usuários
* `chmod 744` : adiciona permissão de execução para o usuário atual e somente leitura para os outros

## executando um script
* `./script.sh` : abre um shell filho do atual, executa o script e retorna o resultado
* `source script.sh` ou `. script.sh`: executa o script na sessão atual do shell
* `bash script.sh` : executa o script com um interpretador específico
* `./script.sh &` : executa o script em modo deamon, ou seja, em background

## alterando o PATH
* `PATH="$PATH:/home/usuario/Cursos/ShellScript/Scripts"` : adiciona ao PATH o meu diretório de scripts
* `~/.profile` : arquivo responsável por configurar a variável $PATH ao inicial a sessão do usuário

# Exit codes
## códigos
* 0 a 255 : 0 é sucesso, qualquer outra coisa é não sucesso

## consultando o código
* `$?` : variável que armazena o código de saída(retorno) do último comando
* `echo $?` : mostra o valor que está na variável
* `RETURN_CODE=$?` : armazena o valor do código de erro em uma variável

## informando o código
* `exit 10` : sai do script com o código 10
* `exit` : sai do comando com o código 0

# read - ler uma entrada do usuário
## ler uma variável
* `read NOME` : o valor de entrada e armazena em NOME

## lendo múltiplas entradas
* `read VAR1 VAR2 VAR3` : se digitar "cuso shell script" cada parte separada por espaço e armazena em uma variável diferente

## modo prompt - adicionando texto para o usuário
* `read -p "Informe o seu curso: " CURSO` : mostra o usuário o texto, recebe a entrada e armazena em CURSO

## modo secret - escode o que foi digitado
* `read -s CODIGO` : armazena que o usuário digita mas não mostra no terminal

# Argumentos - ler parâmetro passados para o programa quando ele é iniciado
## variávais dos argumentos
* `$0` : Nome do programa
* `$#` : Quantidade de parâmetros
* `$*` : Todos os parâmetros inseridos
* `$1-9` : Cada um dos parâmetros

# Estruturas condicionais
## if
```
if <comando>
then
	comando1
	comando2
	comando3
fi

if <comando>
then
	comando1
else
	comando2
fi

if <comando>
then
	comando1
elif <comando>
then 
	comando2
else
	comando3
fi
```

## test
* `test <expressão>` : testa a expressão e retorna 0 para sucesso ou outra coisa para erro
* `test 50 -qt 100` : se 50 é maior que 100
* `[ 50 -gt 100]` : omite a palavra teste e usa []
* exemplo com if:
```
VAR1=12
if test "$VAR1" -gt 10
then
	echo sucesso
fi

if ["$VAR1"-gt 10]
then
	echo sucsso
fi
```

## ! - negação
```
VAR=12
if [! "$VAR1" -gt 10]
then
	# não entra nessa condição
	echo sucesso
fi
```

## -a - e (and)
```
VAR=12
if ["$VAR1" -gt 10 -a "$VAR1" -lt 20] # AND
then
	echo sucesso
fi
```

## -o - ou (or)
```
VAR=12
if ["$VAR1" -gt 10 -o "$VAR1" -eq 5] # OR 
then
        echo sucesso
fi
```

# Case
```
case $valor in
	padrão1)
		comandos
		;;
	padrão2)
		comandos
		;;
	*)
		comandos
		;;
esac

case $opcao in
	1)
		echo "opção incluir"
		;;
	2)
		echo "opção remover"
		;;
	*)
		echo "opção inexistente"
		;;
esac

case $caracter in
	[0-9])
		echo "o caractere informado é um número"
		;;
	[A-Z])
		echo "o caractere informado é uma letra maiúscula"
		;;
	[a-z])
		echo "o caractere informado é uma letra minúscula"
		;;
esac
```

# Loops
## for
```
for var in val1 val2 ... valn
do
	comando1
	comando2
	...
done

for num in 1 2 3 4 5
do
	echo "O número atual é $num!"
done

for arquivo in alunos*
do
	echo "O arquivo atual é $arquivo"
done

for sequencia in $(seq 5 10)
do
	echo "O número é $sequencia"
done

for sequencia in {5..10}
do
	echo "O número é $sequencia"
done

for sequencia in $(seq 1 5 50)
do
	echo "num $sequencia"
done

for sequencia in {1..50..5}
do
	echo "O número é $sequencia"
done

for i in $(cat arquivo.txt)
do
	echo "O valor atual é $i"
done

for ((i=5 ; i <=20 ; i++))
do
	echo "o número é $i"
done
```

## IFS - internal filed separator
* `set|grep IFS` : mostra os valores padrões do IFS
```
for var in $(cat ../CursoShellScript/arquivos/alunos2.txt)
do
	echo "exibindo valor: $var"
done

# Exibe um valor a cada vez q encontrar um espaço ou uma quebra de linha
# exibindo valor: Andre
# exibindo valor: Gonçalves
# exibindo valor: Paulo
# exibindo valor: Freitas
# exibindo valor: Maria
# exibindo valor: Antonieto
```

### Alterando o IFS
```
OLDIFS=$IFS
IFS=:
for var in $(tail /etc/passwd)
do
	echo "exibindo $var"
done
IFS=$OLDIFS
```

## while
```
while <comando>
do
	comando1
	comando2
	...
done

x=1
while [ $x -le 20 ]
do
	echo "O valor atual é $x"
	x=$(expr $x + 1)
done

while [ $(px axu | wc -l) -lt 300  ]
do
	echo "Tudo ok"
	sleep 30
done

while ls /var/lock/processo.lock > /dev/null
do
	echo "Processo em execução"
	sleep 30
done
```

## util
```
until <comando>
do
	comando 1
	comando 2
done

x=1
until [ $x -eq 20 ]
do
	echo O valor atual é $x
	x=$(expr $x + 1)
done

until [ $(ps axu | wc -l) -ge 300 ]
do
	echo "tudo ok"
	sleep 30
done
```

## break
```
while ls /var/lock/processo.lock > /dev/null
do
	if [ $(date +%H) -gt 18 ]
	then
		break
	fi
	echo "processo em execução"
	sleep 30
done
```

## continue
```
while ls /var/lock/processo.lock > /dev/null
do
        if [ $(date +%H) -gt 18 ]
        then
                sleep 3600
		continue
        fi
        echo "processo em execução"
        sleep 30
done
```

# Funções
```
function nome-funcao () {
}

nome-funcao () {
}

# chamando
nome-funcao

nome-funcao par1 par2

VAR1=$(nome-funcao)
```

## varivaveis
```
# local
local VAR1="Shell script"
```

## return code
```
# retorn code pode ser de 0 a 255
return 10

# acesso do retorno
echo $?
```

# Logs
## Redirecionamento
```
# redireciona saida normal e de erro para um arquivo
./Script.sh >> log.out 2>&1

# redireciona saida normal e de erro para um arquivo e para a tela
./Script.sh | tee -a log.out
```

## exec
```
# redireciona todas as saídas do script em um arquivo
# mesmo sem especificar com > ou utulizar o tee
LOG="$HOME/Scripts/log_interno.out"
exec 1>> $LOG
exec 2>&1

echo "teste"
echo "teste 2"
```

### exec com tee
```
LOG="$HOME/Scripts/log_interno.out"
# mostra na tela e coloca no arquivo de log
exec 1>> >(tee -a "$LOG")
exec 2>&1
 
echo "teste"
echo "teste 2"
```

## rsyslog - sistemas de log do linux
* instalar o rsyslog: `sudo apt-get -y install rsyslog`
* criar um arquivo novo em /etc/rsyslog.d/scripts.conf
* criar os facilities, priorities e caminho:
```
# facilities.pririties	path
local0.*	/var/log/scripts.log
local1.*	/var/log/scripts.log
local2.*	/var/log/outroscript.log
```
* reiniciar o rsyslog: service rsyslog restart (systemctl restart rsyslog)
* verificar se reiniciou olhando o horário do processo: ps axu | grep rsyslog
* (opcional) criar o arquivo de log: touch /var/log/scripts.log
* (opcional) mudar permissão do arquivo de log para as mesmas do syslog: chown syslog:adm scripts.log
* para criar logs dentro do script, utilize o comando: `logger -p local0.err "teste de mensagem de erro"`
* para criar logs dentro do script com tag: `logger -p local0.warn -t [Script Novo] "teste de mensagem de erro"`
* para criar logs e mostrar na tela: `sort $ARQUIVOALUNOS | tee -a >(logger -p local0.warn -t [$0])`

## mail - enviando email contendo os logs para servidores internos
* instalar o cliente de email: `sudo apt-get install bsd-mailx`
* instalar o postfix para enviar emails internos: `sudo apt-get install postfix`
* reiniciar o postfix: `service postfix restart` (https://www.tecmint.com/setup-postfix-mail-server-in-ubuntu-debian/)
* enviando email:
```
mail -s "assunto" mail@email.com < arquivo.txt # se for local, nome do usuário: ex ricardo
# ou
echo "teste email" | mail -s "testando" mail@email.com # se for local, nome do usuário ex: root
```
* verificando caixa de entrada de email: `mail`

## mutt - cliente de email para o mail do shell, funciona para enviar email por servidores externos
* instalação:  `sudo apt-get install mutt`

## sendemail - cliente de email SMTP para a o shell, enviar email através de servidores externos
* instalação: `sudo apt-get install sendemail`
* github: https://github.com/mogaal/sendemail
* tutorial: https://www.vivaolinux.com.br/artigo/Enviando-emails-pelo-terminal



