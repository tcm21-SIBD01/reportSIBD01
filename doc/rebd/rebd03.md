# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo1: Entidades e Atributos

Funcionario (nome, *telefone, morada, cc, _nidentificacao)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite)

Formacao (maquilhagem, cosmetica, perfumaria)



### Passo2: Associações 1:1

Não existem associações com cardinalidade 1:1



### Passo3: Associações 1:N
Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade
#maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)



### Passo4: Associações N:M

Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade
#maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

PrecisaDe (#_nidentificacao -> Funcionario, #maquilhagem -> Formacao, #cosmetica -> Formacao, #perfumaria -> Formacao)

Envia ( #maquilhagem -> Produto, #cosmetica -> Produro, #perfumaria -> Produto, #tipoproduto -> Entrega)



### Passo5: Atributo Multivalor

Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade
#maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

PrecisaDe (#_nidentificacao -> Funcionario, #maquilhagem -> Formacao, #cosmetica -> Formacao, #perfumaria -> Formacao)

Envia ( #maquilhagem -> Produto, #cosmetica -> Produro, #perfumaria -> Produto, #tipoproduto -> Entrega)

Contacto (#_nidentificacao -> Funcionario, telefone)



### Passo 6: Associação ternária

Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade
#maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

PrecisaDe (#_nidentificacao -> Funcionario, #maquilhagem -> Formacao, #cosmetica -> Formacao, #perfumaria -> Formacao)

Envia ( #maquilhagem -> Produto, #cosmetica -> Produro, #perfumaria -> Produto, #tipoproduto -> Entrega)

Contacto (#_nidentificacao -> Funcionario, telefone)

Tem ( #maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor, ( #maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

 

### Passo 7: Entidades Fracas

Não existem entidades fracas


## Relacoes 


|Funcionario|         |      |  |               |              |               |          |
|-----------|-------- |------|--|---------------|--------------|---------------|----------|
|nome       |*telefone|morada|cc|_nidentificacao|#manha->Turno|#manha->Turno|#noite->Turno|

|Seccao     |         |          |     |         |        |       |          |             
|-----------|---------|----------|-----|---------|--------|-------|----------|
|maquilhagem|cosmetica|perfumaria|caixa|reposicao|gerencia|limpeza|fornecedor|

|Fornecedor |         |          |            
|-----------|---------|----------|
|maquilhagem|cosmetica|perfumaria|

|Horario|          |         |      
|-------|----------|---------|
|horafim|horainicio|diasemana|

|Entrega     |        |       |          |                        |                      |
|------------|--------|-------|----------|------------------------|----------------------|
|_tipoproduto|validade|reverva|quantidade|#maquilhagem->Fornecedor|#cosmetico->Fornecedor|

|Entrega                  |      
|-------------------------|
|#perfumaria -> Fornecedor|


|Produto    |         |          |      
|-----------|---------|----------|
|maquilhagem|cosmetico|perfumaria|

|Turno|     |     |                    |                  |                   |           
|-----|-----|-----|--------------------|------------------|-------------------|
|manha|tarde|noite|#maquilhagem->Seccao|#cosmetico->Seccao|#perfumaria->Seccao|


|Turno         |                  |                 |                |           
|--------------|------------------|-----------------|----------------|
|#caixa->Seccao|#reposicao->Seccao|#gerencia->Seccao|#limpeza->Seccao|

|Turno              |                 |                    |                   |
|-------------------|-----------------|--------------------|-------------------|
|#fornecedor->Seccao|#horafim->Horario|#horainicio->Horario|#diasemana->Horario|

|Formacao   |         |          |      
|-----------|---------|----------|
|maquilhagem|cosmetico|perfumaria|

|PrecisaDe                    |                      |                       |                  |
|-----------------------------|----------------------|--------------------|---------------------|
|#_nidentificacao->Funcionario|#maquilhagem->Formacao|#cosmetica->Formacao|#perfumaria->Formacao|

|Envia                |                   |                    |                        |       
|---------------------|-------------------|--------------------|------------------------|
|#maquilhagem->Produto|#cosmetica->Produto|#perfumaria->Produto|#_tipoproduto -> Entrega|

|Contacto                     |        |      
|-----------------------------|--------|
|#_nidentificacao->Funcionario|telefone|

|Tem                     |                      |                       |                    |  
|------------------------|----------------------|-----------------------|--------------------|
|#maquilhagem->Fornecedor|#cosmetico->Fornecedor|#perfumaria->Fornecedor|#maquilhagem->Seccao|

|Tem                |                  |                 |                    |                   | 
|-------------------|------------------|-----------------|--------------------|-------------------|
|#cosmetico->Seccao#|perfumaria->Seccao|#horafim->Horario|#horainicio->Horario|#diasemana->Horario|


## Normalização do Esquema Relacional


| Nome do funcionario | Número de identificação | Secção      | Turno |
| ------------------- | ----------------------  | ----------- | ----- |        
| Maria Augusta       |             1           | Maquilhagem | Manhã |
| ------------------- | ----------------------  | ----------- | ----- |
| Ana Soares          |             2           | Maquilhagem | Manhã |
| ------------------- | ----------------------  | ----------- | ----- |
| Joana Carvalho      |             3           | Maquilhagem | Tarde |
| ------------------- | ----------------------  | ----------- | ----- |
| Claúdio Ramos       |             4           | Maquilhagem | Tarde |
| ------------------- | ----------------------  | ----------- | ----- |
| Inês Batista        |             5           | Maquilhagem | Tarde |




---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
