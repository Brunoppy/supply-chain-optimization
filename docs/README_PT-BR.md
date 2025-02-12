
---

### 📖 **README.md (Versão em Português)**  

```md
# Otimização da Cadeia de Suprimentos

## 📌 Descrição
Este projeto foi desenvolvido para otimizar a cadeia de suprimentos, permitindo rastrear remessas, gerenciar armazéns e manter um controle eficiente de estoque.

## 📂 Estrutura do Banco de Dados
| Nome da Tabela  | Descrição |
|-----------------|-----------|
| `fornecedores`  | Armazena informações sobre fornecedores, incluindo pontuação de confiabilidade. |
| `armazens`      | Lista os armazéns e suas capacidades. |
| `remessas`      | Rastreia envios de fornecedores para armazéns. |
| `estoque`       | Gerencia os níveis de estoque em cada armazém. |

## 🔍 Principais Consultas SQL
| Objetivo da Consulta | Comando SQL |
|----------------------|------------|
| Consultar remessas pendentes | `SELECT * FROM remessas WHERE status = 'Pendente';` |
| Monitorar níveis de estoque | `SELECT nome_armazem, nome_produto, nivel_estoque FROM estoque JOIN armazens ON estoque.armazem_id = armazens.armazem_id;` |

## 🚀 Como Usar
1. Execute o script SQL para criar o banco de dados e tabelas.
2. Insira dados de exemplo para fornecedores, armazéns e remessas.
3. Use as consultas fornecidas para analisar status de remessas e níveis de estoque.

## 📤 Como Enviar para o GitHub
```bash
cd caminho/do/projeto  # Navegar até a pasta do projeto
git init  # Inicializar o repositório (caso ainda não tenha feito)
git add .  # Adicionar todos os arquivos
git commit -m "Adicionado Projeto de Otimização da Cadeia de Suprimentos"
git remote add origin https://github.com/SeuUsuario/SeuRepositorio.git  # Adicionar repositório GitHub
git push -u origin main  # Enviar arquivos para o GitHub
