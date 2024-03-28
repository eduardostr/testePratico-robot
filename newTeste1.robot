*** Settings ***
Resource         newTeste2.robot
Documentation    Essa suíte testa o acesso do site OrangeHRM
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso 01 - Acessar Home Page
    [Documentation]  Esse teste verifica o acesso a home page do site OrangeHRM
    [Tags]           home_page
    Acessar a home page do site OrangeHRM
    Inserir um texto no campo Username
    Inserir um texto no campo Password
    Clicar no botão de login
    Clicar no menu PIM do dashboard
    Inserir um texto no campo firstName
    Inserir um texto no campo lastName
    Clicar no botão Save
    Verificar e excluir o novo funcionário
    Verificar se o título da página é OrangeHRM