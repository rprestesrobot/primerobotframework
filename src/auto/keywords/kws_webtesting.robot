*** Settings ***
Documentation       Aqui estarão presentes todas as keywords do Web Testing

Resource            ../../config/package.robot


Library    XML
Library    Screenshot

*** Keywords ***
Dado que o usuário esteja na página inicial
    #Verifica o título da página
    Title Should Be    My Store
    #espera o elemento busca
    Wait Until Element Is Visible    id=search_query_top

Quando digitar o produto "${PRODUTO}" no campo de pesquisa
    Input Text    id=search_query_top    ${PRODUTO}


E clicar no botão Pesquisar
    Click Element    xpath=//button[@name="submit_search"]

Então o produto deverá ser listado no site
    
    #Verifica se o elemento SEARCH  "${PRODUTO}" é exibido, se sim, o produto foi retornado na pesquisa
    Wait Until Element Is Visible    xpath=//span[@class="lighter"]
    
Então o produto não deverá ser listado no site
     #Verifica se o elemento SEARCH  "${PRODUTO}" é exibido, se sim, o produto foi retornado na pesquisa
    Wait Until Element Is Not Visible    xpath=//span[@class="lighter"]

Quando fizer um mouse over na categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over    xpath=//*[@id="block_top_menu"]/ul/*/a[@title="${CATEGORIA}"]
    

E Clicar na subcategoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul/li/ul/li/ul/li/a[@title="${SUBCATEGORIA}"]
    Click Element    xpath=//*[@id="block_top_menu"]/ul/li/ul/li/ul/li/a[@title="${SUBCATEGORIA}"]

Então os produtos da subcategoria "${SUBCATEGORIA}" devem ser apresentados na página
    Wait Until Element Is Visible    xpath=//h1[@class="page-heading product-listing"]/span[@class="cat-name"]


Quando o usuário clicar em "Sign In"
    Click Element    xpath=//*[@id="header"]/div/div/div/nav/div/a[@class='login']
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/h1[contains(text(),"Authentication")]
    
E informar um email válido
    ${FAKE_EMAIL}                    FakerLibrary.Free Email
    Input Text    xpath=//*[@id="email_create"]    ${FAKE_EMAIL} 
    

E clicar em "Create an account"
    Click Button    id=SubmitCreate  
    Wait Until Element Is Visible    xpath=//*[@id="account-creation_form"]/*/h3[contains(text(),"Your personal information")]  
        
E preencher os dados obrigatórios
    #Radio button    
    IF     "${CADASTRO.SEXO}" == "masculino"
    Select Radio Button    id_gender    1
    ELSE
    Select Radio Button    id_gender    2
    END
    #GERA VALORES ALEATÓRIOS PARA AS VARIÁVEIS ATRAVÉS DA LIBRARY FAKER
    ${FAKE_NOME}        FakerLibrary.Name
    ${FAKE_ULT_NOME}        FakerLibrary.Last Name
    ${FAKE_ENDERECO}        FakerLibrary.Street Address
    ${FAKE_CIDADE}        FakerLibrary.City
    ${FAKE_CEP}        FakerLibrary.Postcode
    ${FAKE_PHONE}    FakerLibrary.Phone Number
    ${FAKE_EMAIL}                    FakerLibrary.Free Email
    Set Suite Variable    ${FAKE_EMAIL} 
    
    Input Text    id=customer_firstname    ${FAKE_NOME} 
    Input Text    id=customer_lastname    ${FAKE_ULT_NOME}
    Input Text    id=email    ${FAKE_EMAIL} 
    Input Password    id=passwd    ${CADASTRO.SENHA}
    Input Password    id=passwd    ${CADASTRO.SENHA}
    Select From List By Value    xpath=//*[@id="days"]    ${CADASTRO.DIA}
    Select From List By Value    xpath=//*[@id="months"]    ${CADASTRO.MES}
    Select From List By Value    xpath=//*[@id="years"]    ${CADASTRO.ANO}

    #Debug
    
    #Endereço
    Input Text    id=firstname    ${CADASTRO.NOME} 
    Input Text    id=lastname    ${CADASTRO.ULT_NOME}
    Input Text    id=address1    ${CADASTRO.ENDERECO}
    Input Text    id=city    ${CADASTRO.CIDADE}
    Select From List By Label    id=id_state    Arizona
    Input Text    id=postcode    ${CADASTRO.CEP} 
    Select From List By Value    id=id_country    21
    Input Text    id=phone_mobile    ${FAKE_PHONE}  
    Input Text    id=alias    ${CADASTRO.REFERENCIA}

E enviar o cadastro
    Click Button    id=submitAccount
    

Então o cadastro deve ser efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/h1