#######como proceder para usar a função MergeDBSources do Bibliometrix (pack do ambiente R) para mesclar os resultados de buscas nas bases Scopus e WoS.

####Script do Bibliometrix com os comentários
#Definir o diretório onde estão os arquivos e serão gravados outros
setwd()
getwd()
#Carregar o app Bibliometrix para o ambiente R
install.packages("bibliometrix")
library(bibliometrix)
#Importar os arquivos da busca para o ambiente R e convertê-los em tabela (dataframe)
S=convert2df("scopus.bib", dbsource = "scopus", format = "bibtex")
View(S)
W=convert2df("savedrecs.bib", dbsource = "isi", format = "bibtex")
View(W)
#Fazer a união das duas tabelas com os dados das buscas nas base de dados
Database=mergeDbSources(S, W, remove.duplicated = TRUE)
View(Database)
dim(Database)
#Gravar a tabela resultante em um arquivo formato Excel para a limpeza final dos dados
install.packages("openxlsx", depedencies = TRUE)
library(openxlsx)
write.xlsx(Database, file = "Database.xlsx")
biblioshiny()
