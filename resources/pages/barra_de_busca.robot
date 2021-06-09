*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BARRA_BUSCA}          css:input#twotabsearchtextbox

*** Keywords ***
Barra de Busca
    [arguments]                      ${BUSCA} 

    Wait Until Element Is Visible    ${BARRA_BUSCA} 
    Input Text                       ${BARRA_BUSCA}     ${BUSCA}        
    Press Keys                       ${BARRA_BUSCA}     ENTER

