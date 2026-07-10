# Restrições do Banco de Dados

| Restrição | Objetivo | Testes Realizados | Resultado Esperado | Erro Validado |
|-----------|----------|-------------------|--------------------|---------------|
| **PRIMARY KEY (PK)** | Garantir que cada registro possua um identificador único, impedindo duplicidades. | Inserção de registros com identificadores únicos e tentativa de inserir um identificador já existente. | O banco deve aceitar identificadores únicos e rejeitar registros duplicados. | `ORA-00001: unique constraint violated` |
| **FOREIGN KEY (FK)** | Garantir a integridade referencial entre as tabelas relacionadas. | Inserção de registros com chaves estrangeiras válidas e tentativa de utilizar referências inexistentes. | O banco deve permitir relacionamentos válidos e impedir referências inexistentes. | `ORA-02291: integrity constraint violated - parent key not found` |
| **NOT NULL** | Garantir que os campos obrigatórios sempre recebam um valor. | Inserção de registros completos e tentativa de inserir valores nulos em campos obrigatórios. | O banco deve aceitar registros completos e rejeitar valores nulos. | `ORA-01400: cannot insert NULL` |
| **CHECK** | Garantir que determinados atributos respeitem as regras de negócio definidas. | Inserção de valores válidos e tentativa de inserir valores fora das regras estabelecidas. | O banco deve aceitar apenas valores válidos. | Erro de violação da restrição `CHECK`. |

---

# Integridade Referencial

Foram realizados testes para validar a consistência dos relacionamentos entre as tabelas.

| Cenário | Resultado Esperado |
|----------|--------------------|
| Associação entre registros existentes | Os relacionamentos devem ser criados corretamente. |
| Inserção de referências inexistentes | O banco deve impedir a operação. |
| Exclusão de registros relacionados | O banco deve preservar a integridade referencial conforme as restrições definidas. |

---

# Testes de Inserção de Dados

Os seguintes cenários foram executados durante a validação do banco de dados:

| Cenário | Status |
|----------|--------|
| Inserção de dados válidos | ✅ Validado |
| Inserção de registros duplicados | ✅ Validado |
| Inserção de referências inexistentes | ✅ Validado |
| Inserção de valores nulos em campos obrigatórios | ✅ Validado |
| Inserção de valores fora das regras definidas | ✅ Validado |

---

# Conclusão

Os testes realizados confirmaram que todas as restrições implementadas funcionam conforme o esperado, garantindo a **integridade**, **consistência** e **confiabilidade** dos dados armazenados no banco de dados.
