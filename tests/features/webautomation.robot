*** Settings ***
Documentation    Aqui estarão presentes todos os teste automatizados do módulo de automação web

Resource    ../../src/config/package.robot

Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Variables ***
&{NOVO_USUARIO}
...    nome= Renan
...    ult_nome=Prestes
...    email=renan@prestes.com.br
...    endereco=Rua Raymundo Magrini
...    universidade=Uninove
...    profissao=Analyst
...    genero=Masculino
...    idade=27

*** Test Cases ***

Cenário 1: Criar usuário com sucesso
    [Tags]    abre_nav
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos
    Quando Clicar em Criar
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"
    E dados validados

Cenário 2: Tentar cadastrar novo usuário sem email
    [Tags]  cen2    
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos menos o email
    Quando Clicar em Criar
    Então deve ser apresentada a mensagem "Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"
   



