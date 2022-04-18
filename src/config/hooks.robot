*** Settings ***
Documentation     Aqui estarão presentes todos arquivos para inicialização e finalização de testes


Resource    package.robot

*** Keywords ***
Abrir navegador
# Abre o navegador
    Set Selenium Implicit Wait    ${CONFIG.IMPLICITY_WAIT}
    Open Browser    about:blank    ${CONFIG.BROWSER_NAME}
    #Ir para a página de criação de usuário
    Go To    https://automacaocombatista.herokuapp.com/users/new
    #Maximizar a tela do navegador
    Maximize Browser Window


Fechar navegador
#Pós Teste Finalizado
    Close Browser

Abrir navegador desafio
# Abre o navegador
    Set Selenium Implicit Wait    ${CONFIG.IMPLICITY_WAIT}
    Open Browser    about:blank    ${CONFIG.BROWSER_NAME}
    #Ir para a página de criação de usuário
    Go To    ${CONFIG.URL}
    #Maximizar a tela do navegador
    Maximize Browser Window