# C2 : Esquema conceptual

## Modelo E/A

### Entidades: 

FUNCIONARIO (nome, {telefone (telefonepessoal, telefonecasa)}, morada, nic , <ins>nidentificacao</ins>)

SECCAO (nome,<ins>id</ins> ) 

FORNECEDOR (nome, <ins>nid</ins> , {telefone (telefonepessoal, telefoneempresa) })

HORARIO (<ins>id</ins>, horafim, horainicio, diasemana)

ENTREGA (<ins>nentrega</ins> , validade, reserva, quantidade)

PRODUTO (nome,tipoproduto, <ins>codigo</ins> ,validade )

TURNO (<ins>id</ins>, partedia ,hora)

FORMACAO (nome, <ins>tipoformacao</ins> )


### Associacoes:

possui (FUNCIONARIO,TURNO) N:1 T/P

precisaDe (FUNCIONARIO, FORMACAO) M:N P/P

dependeDe (TURNO, SECCAO) N:M P/P

definidoPor (TURNO, HORARIO) N:M T/P

tem (FORNECEDOR, HORARIO ) N:M T/P

envia (ENTREGA, PRODUTO) N:M P/T

realiza (FORNECEDOR, ENTREGA) 1:N P/T

### Diagrama 

![An alternative description](imagens/diagrama1.png)

## Regras de negócio adicionais (Restrições)

Só poderá trabalhar nas secções da maquilhagem, cosméticos e perfumaria quem possuir uma formação especializada na área da cosmética. 

Não pode existir troca de turnos entre funcionários. 

Apenas gerentes podem receber entregas. 

O gerente deve fazer uma análise mensal relativamente ás vendas efectuadas em cada mês. 

[< Previous](rebd01.md) | [^ Main](https://github.com/tcm21-SIBD01/reportSIBD01) | [Next >](rebd03.md)
:--- | :---: | ---: 
