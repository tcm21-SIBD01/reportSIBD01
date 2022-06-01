# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

Passo1: Entidades e Atributos

Funcionario (nome, *telefone, morada, cc, _nidentificacao)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecedor (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (_tipoproduto, validade, reserva, quantidade)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite)

Formacao (maquilhagem, cosmetica, perfumaria)

Passo2: Associações 1:1

Não existem associações com cardinalidade 1:1

Passo3: Associações 1:N
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

Passo4: Associações N:M

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

Passo5: Atributo Multivalor

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

Passo6: Associação ternária

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

Passo7: Entidades Fracas

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

|Entrega     |        |       |          |
|------------|--------|-------|----------|
|_tipoproduto|validade|reverva|quantidade|

|Produto    |         |          |      
|-----------|---------|----------|
|maquilhagem|cosmetico|perfumaria|

|Turno|     |     |                    |                  |                   |           
|-----|-----|-----|--------------------|------------------|-------------------|
|manha|tarde|noite|#maquilhagem->Seccao|#cosmetico->Seccao|#perfumaria->Seccao|

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

|Salario|      |      
|-------|------|
|valor  |mensal|

|PrecisaDe         |                   |                      |                     |           |
|------------------|-------------------|----------------------|---------------------|-----------|
|#_nidentificacao->Funcionario|#maquilhagem->Formacao|#cosmetica->Formacao|#perfumaria->Formacao|

|Envia                |                   |                    |                       |       
|---------------------|-------------------|--------------------|-----------------------|
|#maquilhagem->Produto|#cosmetica->Produro|#perfumaria->Produto|#tipoproduto -> Entrega|

|Formacao                     |        |      
|-----------------------------|--------|
|#_nidentificacao->Funcionario|telefone|


## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_

---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
