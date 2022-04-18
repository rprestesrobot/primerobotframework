*** Settings ***
Documentation       Aqui estarão presentes todas as keywords pelo teste Web

Resource            ../../config/package.robot

*** Variables ***
&{NOVO_USUARIO}

*** Keywords ***
Dado que o cliente esteja na tela de cadastro
    ##Fluxo de Teste
    #Verificar o título da Tab do navegador
    Title Should Be    Automação com Batista
    #Verificar o título do Formulário Criar novo Usuário
    Wait Until Element Is Visible    xpath=//*[contains(text(),"Novo Usuário!!")]

E preencher todos os campos
 #Preencher o formulário
    Input Text    id=user_name    ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email    ${NOVO_USUARIO.email}
    Input Text    id=user_address    ${NOVO_USUARIO.endereco}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile    ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender    ${NOVO_USUARIO.genero}
    Input Text    id=user_age    ${NOVO_USUARIO.idade}

Quando Clicar em Criar
#clicar no botão criar
    Click Element    xpath=//input[@value="Criar"]

Então deve ser apresentada a mensagem "${MENSAGEM}"
    #Validar a tela de cadastro com sucesso
    Wait Until Element Is Visible    xpath=//*[contains(text(),"${MENSAGEM}")]

E dados validados
#Validar os dados
    Wait Until Page Contains    ${NOVO_USUARIO.nome}
    Wait Until Page Contains    ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains    ${NOVO_USUARIO.email}
    Wait Until Page Contains    ${NOVO_USUARIO.endereco}
    Wait Until Page Contains    ${NOVO_USUARIO.universidade}
    Wait Until Page Contains    ${NOVO_USUARIO.profissao}
    Wait Until Page Contains    ${NOVO_USUARIO.genero}
    Wait Until Page Contains    ${NOVO_USUARIO.idade}

 E preencher todos os campos menos o email
    Input Text    id=user_name    ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_address    ${NOVO_USUARIO.endereco}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile    ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender    ${NOVO_USUARIO.genero}
    Input Text    id=user_age    ${NOVO_USUARIO.idade}
