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
* `ps axu|more` : lista com cabeçalho

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
 
