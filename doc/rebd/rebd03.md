# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidades e Atributos

Funcionario (_n.id, nome, morada, nic, telefone*)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega(_tipoProduto, validade, reserva, quantidade)

### Passo 2: Associações 1:1
Não existe associações de carnalidade 1:1

#### Passo 3: Associações 1:N

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade
#_id -> Fornecedor)

### Passo 4: Associações N:M

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade

Precisade ( #_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

### Passo 5: Atributo Multivalor

Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)


### Passo 6: Associação ternária


Funcionario (_n.id, nome, morada, nic, telefone*
#_parteDia -> Turno)

Formacao (_tipoFormacao, nomeFormacao)

Turno (_parteDia, hora
#_gerencia -> Turno, #_diaSemana -> Horario)

Horario (_diaSemana, horaFim, horaInicio)

Seccao (_gerencia, cosmético, fornecedor, reposição, caixa, perfumaria, limpeza, maquilhagem)

Fornecedor (_id, nome, tipoStock, telefone*)

Produto (_codigo, nome, tipoProduto, validade)

Entrega (_tipoProduto, validade, reserva, quantidade

Precisade (#_n.id -> Funcionario, #_tipoFormacao -> Formacao)

Envia (#_tipoProduto -> Entrega, #_codigo -> Produto)

Contacto (#_n.id -> Funcionario, #_id -> Fornecedor, telefone)

Tem ( #_id -> Fornecedor, #_gerencia -> Seccao, #_diaSemana ->Horario)


### Passo 7: Entidades Fracas

Não existe Entidades Fracas



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






---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
