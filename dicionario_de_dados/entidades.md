=========
ENTIDADES
=========

## Diretor

A entidade Diretor representa os profissionais responsáveis pela direção dos filmes cadastrados no sistema.

Armazena informações de identificação do diretor, como nome, cidade e país de origem.

---

## Filme

A entidade Filme representa as obras cinematográficas cadastradas no sistema.

Cada filme possui informações como título e está associado a um diretor responsável.

---

## Ator

A entidade Ator representa os profissionais que participam dos filmes cadastrados.

Armazena informações de identificação dos atores, como nome, cidade, país e gênero.

---

## Participação

A entidade Participação representa a associação entre Filme e Ator.

Foi criada para controlar o relacionamento entre filmes e atores, permitindo registrar quais atores participam de quais filmes.

---

## Prêmio

A entidade Prêmio representa os tipos de premiações existentes no sistema.

Armazena informações referentes à descrição do prêmio.

---

## Premiação

A entidade Premiação representa a associação entre Filme e Prêmio.

Foi criada para registrar quais prêmios foram recebidos por cada filme, incluindo informações complementares como o ano da premiação.
