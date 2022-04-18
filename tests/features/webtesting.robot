*** Settings ***

Documentation    Desafio Primeiro Teste: Web Testing

Resource    ../../src/config/package.robot

Test Setup    Abrir navegador desafio
Test Teardown    Fechar navegador

*** Variables ***
#Variaveis cenário 2
&{PRODUTO}
...    existente=Blouse
...    inexistente=Cueca

${CATEGORIA}    Women
${SUBCATEGORIA}    Summer Dresses

#variaveis cenário 4
# &{NOVO_CADASTRO}
# ...    nome= Renan
# ...    ult_nome=Prestes
# ...    email=renan2@prestes.com.br
# ...    endereco=Rua Raymundo Magrini
# ...    universidade=Uninove
# ...    profissao=Analyst
# ...    genero=masculino
# ...    idade=27
# ...    cidade=Ferraz
# ...    cel=11983606604
# ...    cep=12345
# ...    referencia=Parque
# ...    ${CADASTRO.SENHA}=12345678

# ${SEXO}    masculino

*** Test Cases ***
Cenário de Teste 01: Pesquisar produto existente
    [Tags]    Prod_Exist
    Dado que o usuário esteja na página inicial
    Quando digitar o produto "${PRODUTO.existente}" no campo de pesquisa
    E clicar no botão Pesquisar
    Então o produto deverá ser listado no site

Cenário de Teste 02: Pesquisar produto não existente
    [Tags]    Prod_Inexist
    Dado que o usuário esteja na página inicial
    Quando digitar o produto "${PRODUTO.inexistente}" no campo de pesquisa
    E clicar no botão Pesquisar
    Então o produto não deverá ser listado no site

Cenário de Teste 03: Listar Produtos
    [Tags]    Lista_Produtos
    Dado que o usuário esteja na página inicial
    Quando fizer um mouse over na categoria "${CATEGORIA}" no menu principal superior de categorias
    E Clicar na subcategoria "${SUBCATEGORIA}"
    Então os produtos da subcategoria "${SUBCATEGORIA}" devem ser apresentados na página

Cenário de Teste 04: Adicionar cliente
    [Tags]    Add_cliente
    Dado que o usuário esteja na página inicial
    Quando o usuário clicar em "Sign In"
    E informar um email válido
    E clicar em "Create an account"
    E preencher os dados obrigatórios
    E enviar o cadastro
    Então o cadastro deve ser efetuado com sucesso