*** Settings ***
Library    SeleniumLibrary

*** Variables ***
    
${BUSCA_FAIL}                 xpath://*[@id='search']/div[1]/div/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[1]
${BOTAO_ADD_CARRINHO}         id:add-to-cart-button
${BOTAO_CARRINHO}             id:nav-cart-count-container
${BOTAO_CARRINHO_MODAL}       class:a-button-input


*** Keywords ***

Clicando em "${BUSCA}" para ver os detalhes do produto
    
    Click Element                    css:[alt='${BUSCA}']
    

Adicionando produto e mais "${COMPRA_UM}" ao carrinho
   
    Click Element                   ${BOTAO_ADD_CARRINHO}
    Mouse Over                      css:[alt='${COMPRA_UM}']
    Click Element                   ${BOTAO_CARRINHO_MODAL} 
    Click Element                   ${BOTAO_CARRINHO} 

Adicionando produto ao carrinho

    Click Element                   ${BOTAO_ADD_CARRINHO}
    Click Element                   ${BOTAO_CARRINHO} 


Então vejo a mensagem "${MENSAGEM}"

    Wait Until Element Is Visible    ${BUSCA_FAIL}

    ${RESULT}=               Get WebElement                     ${BUSCA_FAIL}

    Should Be Equal          ${RESULT.text}                     ${MENSAGEM}