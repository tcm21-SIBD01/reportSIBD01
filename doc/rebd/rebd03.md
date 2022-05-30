# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo1: Entidades e Atributos

Funcionario (nome, *telefone, morada, cc, _nidentificacao)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecer (maquilhagem, comestico, perfumaria)

Horario (horafim, horainicio, diasemana)

Entrega (tipoproduto, validade, reserva, quantidade
#maquilhagem -> Fornecedor, #cosmetico -> Fornecedor, #perfumaria -> Fornecedor)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite)

Formacao (maquilhagem, cosmetica, perfumaria)

Salario (valor, mensal)


### Passo 2: Associações 1:1

Não existem associações com cardinalidade 1:1

### Passo 3: Associações 1:N

Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecer (maquilhagem, comestico, perfumaria
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao)

Horario (horafim, horainicio, diasemana)

Entrega (tipoproduto, validade, reserva, quantidade)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

Salario (valor, mensal)

### Passo 4: Associações N:M

Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecer (maquilhagem, comestico, perfumaria
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao)

Horario (horafim, horainicio, diasemana)

Entrega (tipoproduto, validade, reserva, quantidade)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

Salario (valor, mensal)

PrecisaDe (#_nidentificacao -> Funcionario, #maquilhagem -> Formacao, #cosmetica -> Formacao, #perfumaria -> Formacao)

Envia ( #maquilhagem -> Produto, #cosmetica -> Produro, #perfumaria -> Produto, #tipoproduto -> Entrega)

### Passo 5: Atributo Multivalor


Funcionario (nome, *telefone, morada, cc, _nidentificacao
#manha -> Turno, #tarde -> Turno, #noite -> Turno)

Seccao (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

Fornecer (maquilhagem, comestico, perfumaria
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao)

Horario (horafim, horainicio, diasemana)

Entrega (tipoproduto, validade, reserva, quantidade)

Produto(maquilhagem, cosmetico, perfumaria)

Turno (manha, tarde, noite
#maquilhagem -> Seccao, #cosmetico -> Seccao, #perfumaria-> Seccao, #caixa-> Seccao, #reposicao -> Seccao, #gerencia -> Seccao, #limpeza -> Seccao, #fornecedor -> Seccao, #horafim -> Horario, #horainicio -> Horario, #diasemana -> Horario)

Formacao (maquilhagem, cosmetica, perfumaria)

Salario (valor, mensal)

PrecisaDe (#_nidentificacao -> Funcionario, #maquilhagem -> Formacao, #cosmetica -> Formacao, #perfumaria -> Formacao)

Envia ( #maquilhagem -> Produto, #cosmetica -> Produro, #perfumaria -> Produto, #tipoproduto -> Entrega)

Contacto (#_nidentificacao -> Funcionario, telefone)



### Passo 6: associação ternária

Não existem associações ternárias



### Passo 7 : Entidades Fracas

Não existem entidades fracas


## Relacoes 






## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_

---
[< Previous](rebd02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD/) | [Next >](rebd04.md)
