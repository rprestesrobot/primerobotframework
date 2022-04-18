*** Settings ***
Documentation    Aqui estarão presentes todos os teste iniciais do curso de Robot Framework Básico

Library    String

*** Variables ***
&{PESSOA}
...    nome=Renan    
...    sobrenome=Prestes    
...    idade=26    
...    cpf=01332112312    
...    rg=475776640

#Listas devem ser inseridas com @
@{FRUTAS}    
...    abacaxi 
...    pêra 
...    uva 
...    melancia 
...    morango

*** Test Cases ***
Cenário 1: Imprimir dicionário no console
    Log To Console    \n${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}

Cenário 2: Imprimir lista de frutas no consolse
    [Tags]    Lista
    Log To Console    \n${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}

Cenário 3: Soma de dois números
    [Tags]    Somar 
    Somar dois números    5000    5000
    Somar os números "5" e "2"

Cenário 4: Desafio email
    [Tags]    email
    Criar um e-mail    Renan    Prestes    26

Cenário 5: Contar de 0 a 9
    [Tags]    Contar
    Contar de 0 a 9
    Percorrer a Lista de frutas

Cenário 6: Tomar decisões
    [Tags]    Decisão
    Tomar decisões    Maria

Cenário 7: Desafio - Exercício 1 - IF
    [Tags]    Desafio
    Desafio


*** Keywords ***
#Argumento Embutido
Somar dois números
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

Somar os números "${NUM_A}" e "${NUM_B}" 
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

Criar um e-mail
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    #catenate concatena a string
    ${EMAIL}    Catenate    SEPARATOR=_     ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    Log To Console    ${EMAIL}
    [Return]    ${EMAIL}   

Contar de 0 a 9
    FOR    ${contador}    IN RANGE    0    10
        Log To Console    ${contador}
    END

Percorrer a Lista de frutas
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To console    ${fruta}
        
    END

Tomar decisões
    [Arguments]    ${Nome}
    IF    "${Nome}"=="Maria"
        Log To Console    Vou fazer isso quando for Maria
    ELSE IF     "${Nome}"=="João"
        Log To Console    Vou fazer isso com for João!
    ELSE
        Log To Console    Vou fazer isso quando não for ninguem
    END

Desafio
    
    FOR    ${contador}    IN RANGE    0    11
        IF  ${contador}==5
        Log To Console    \nESTOU NO NÚMERO ${contador}
        ELSE IF  ${contador}==8
        Log To Console     ESTOU NO NÚMERO ${contador}
        END  
        
    END