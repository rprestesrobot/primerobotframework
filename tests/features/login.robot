*** Settings ***

Documentation    Desafio Primeiro Teste: Web Testing

Resource    ../../src/config/package.robot

Test Setup    Abrir navegador desafio
Test Teardown    Fechar navegador

*** Test Cases ***
Cenário: login com sucesso
    Dado que cliente tenha cadastro
    Quando informar suas credenciais de acesso
    Então o login será realizado com sucesso