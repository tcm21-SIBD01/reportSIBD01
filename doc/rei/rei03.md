# C3 : Esquema conceptual

## Modelo E/A


### Entidades: 

FUNCIONARIO (nome, *telefone, morada, _cc, nidentificacao)

SECCAO (maquilhagem, cosmetico, perfumaria, caixa, reposiçao, gerencia, limpeza, fornecedores) 

HORARIOFUNCIONARIO (departamento, turno)

FORNECEDOR (maquilhagem, comestico, perfumaria)

HORARIOFORNECEDOR (diafixo, stock) 

STOCK (quantidade, validade, reserva) 

PRODUTO

TURNO

FORMACAO

### Associacoes:

pertenceA (FUNCIONARIO, SECCAO)                  M:N      T/P

definidoPela (HORARIOFUNCIONARIO, SECÇAO)        1:N      T/P

dependeDe (STOCK,HORARIOFORNECEDOR)              N:1      P/T   

entrega (FORNECEDOR, HORARIOFORNECEDOR)          1:1      P/T




### Diagrama: 

![An alternative description](imagens/diagrama1.png)   

Diagrama do modelo Entidade-Associação



## Regras de negócio adicionais (Restrições)

Só poderá trabalhar nas secções da maquilhagem, cosméticos e perfumaria quem possuir uma formação especializada na área da cosmética. 

Não pode existir troca de turnos entre funcionários. 

Apenas gerentes podem receber entregas. 


---
[< Previous](rei02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD01/) | Next >
