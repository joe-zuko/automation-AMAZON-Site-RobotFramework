*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRECO_CAPA}                    css:.a-color-base .a-size-base
${PRECO_MODAL_CARRINHO}          id:price

*** Keywords ***
Verificar se o valor de capa é o mesmo valor do box do carrinho
    
    Wait Until Element Is Visible    ${PRECO_MODAL_CARRINHO}
    Wait Until Element Is Visible    ${PRECO_CAPA}


    ${MODAL}=                        Get WebElement                ${PRECO_MODAL_CARRINHO} 
    ${CAPA}=                         Get WebElement                ${PRECO_CAPA} 
    Should Be Equal                  ${CAPA.text}                  ${MODAL.text} 
   
