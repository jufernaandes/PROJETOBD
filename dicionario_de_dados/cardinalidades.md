# Cardinalidades

| Entidades | Cardinalidade | Descrição |
|-----------|---------------|-----------|
| **Diretor → Filme** | **1:N** | Um diretor pode dirigir um ou vários filmes. Cada filme deve possuir obrigatoriamente um único diretor. |
| **Filme → Participação** | **1:N** | Um filme pode possuir uma ou várias participações registradas. |
| **Ator → Participação** | **1:N** | Um ator pode possuir uma ou várias participações em filmes. |
| **Filme → Premiação** | **1:N** | Um filme pode receber uma ou várias premiações. |
| **Prêmio → Premiação** | **1:N** | Um prêmio pode estar associado a uma ou várias premiações. |
