*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAMECAMPO}   //input[contains(@name,'username')]
${TITULO}     OrangeHRM
${LABELPIM}     PIM
${LOGIN}      Admin
${PASSWORDCAMPO}      //input[contains(@type,'password')]
${SENHA}      admin123
${BUTTONLOGIN}      //button[@type='submit'][contains(.,'Login')]
${MENUPIM}     xpath=//span[text()="PIM"]
${ADD}     xpath=//button[@type='button'][contains(.,'Add')]
${FIRSTNAME}     xpath=//input[@name='firstName']
${LASTNAME}     xpath=//input[@name='lastName']
${NEWFUNCIONARIO}      Novo Funcionário
${SOBRENOME}      Sobrenome
${BUTTONSAVE}      //button[@type='submit'][contains(.,'Save')]
${LABELEMPLOYEENAME}      //label[contains(.,'Employee Name')]
${INPUTEMPLOYEENAME}      (//input[contains(@placeholder,'Type for hints...')])[1]
${SEARCH}      //button[@type='submit'][contains(.,'Search')]
${DELETEEMPLOYEE}      (//button[contains(@class,'oxd-icon-button oxd-table-cell-action-space')])[1]
${CONFIRMDELETE}      //button[@type='button'][contains(.,'Yes, Delete')]

*** Keywords ***
Abrir o navegador
    Open Browser        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site OrangeHRM
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${USERNAMECAMPO}

Inserir um texto no campo Username
    Click Element    locator=${USERNAMECAMPO}
    Input Text    locator=${USERNAMECAMPO}    text=${LOGIN}

Inserir um texto no campo Password
    Click Element    locator=${PASSWORDCAMPO}
    Input Text    locator=${PASSWORDCAMPO}    text=${SENHA}

Clicar no botão de login
    Click Element    locator=${BUTTONLOGIN}
    Wait Until Element Is Visible    ${MENUPIM}    5

Clicar no menu PIM do dashboard
    Click Element    locator=${MENUPIM}
    Wait Until Element Is Visible    ${ADD}
    Click Element    locator=${ADD}
    Sleep    5
    Wait Until Element Is Visible    ${FIRSTNAME}

Inserir um texto no campo firstName
    Click Element    locator=${FIRSTNAME}
    Input Text    locator=${FIRSTNAME}    text=${NEWFUNCIONARIO}

Inserir um texto no campo lastName
    Click Element    locator=${LASTNAME}
    Input Text    locator=${LASTNAME}    text=${SOBRENOME}

Clicar no botão Save
    Click Element    locator=${BUTTONSAVE}
    Sleep    5

Verificar e excluir o novo funcionário
    Wait Until Element Is Visible    ${MENUPIM}
    Click Element    locator=${MENUPIM}
    Wait Until Element Is Visible    ${LABELEMPLOYEENAME}
    Click Element    ${INPUTEMPLOYEENAME}
    Input Text    locator=${INPUTEMPLOYEENAME}    text=${NEWFUNCIONARIO}
    Click Button    ${SEARCH}
    Sleep    5
    Wait Until Element Is Visible    //span[contains(.,'Records Found')]    5
    Click Element    locator=${DELETEEMPLOYEE}
    Wait Until Element Is Visible    //p[contains(.,'Are you Sure?')]
    Click Button    ${CONFIRMDELETE}
    Sleep    5

Verificar se o título da página é OrangeHRM
    Title Should Be    title=${TITULO}