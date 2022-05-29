# C3 : Esquema conceptual

## Modelo E/A


### Entidades: 

FUNCIONARIO (nome, *telefone, morada, cc, _nidentificacao)

SECCAO (maquilhagem, cosmetico, perfumaria, caixa, reposicao, gerencia, limpeza, fornecedore) 

FORNECEDOR (maquilhagem, cosmetico, perfumaria)

HORARIO (horafim, horainicio, diasemana)

ENTREGA (tipoproduto, validade, reserva, quantidade)

PRODUTO (maquilhagem, cosmetico, perfumaria)

TURNO (manha, tarde, noite)

FORMACAO (maquilhagem, cosmetica, perfumaria)

SALARIO (valor, mensal)


### Associacoes:

possui (FUNCIONARIO,TURNO) N:1 T/P

precisaDe (FUNCIONARIO, FORMACAO) M:N P/P

dependeDe (TURNO, SECCAO) N:1 P/P

definidoPor (TURNO, HORARIO) N:1 T/P

tem (FORNECEDOR, SECCAO) N:1 T/P

envia (ENTREGA, PRODUTO) M:N P/T

realiza (FORNECEDOR, ENTREGA) 1:N P/T


### Diagrama: 

![An alternative description](imagens/diagrama1.png)   

Diagrama do modelo Entidade-Associação



## Regras de negócio adicionais (Restrições)

Só poderá trabalhar nas secções da maquilhagem, cosméticos e perfumaria quem possuir uma formação especializada na área da cosmética. 

Não pode existir troca de turnos entre funcionários. 

Apenas gerentes podem receber entregas. 


---
[< Previous](rei02.md) | [^ Main](https://github.com/exemploTrabalho/reportSIBD01/) | Next >
