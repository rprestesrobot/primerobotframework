*** Settings ***
Documentation       Aqui estarão presentes todas as keywords do Web Testing

Resource            ../../config/package.robot


Library    XML

*** Keywords ***

Dado que cliente tenha cadastro

Quando informar suas credenciais de acesso

Então o login será realizado com sucesso