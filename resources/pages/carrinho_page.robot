*** Settings ***
Library    SeleniumLibrary
Library    ../libs/conta.py


*** Variables ***

${BOTAO_COMPRA}                   id:sc-buy-box-ptc-button
${BOTAO_EXCLUIR}                  css:input[type='submit'][data-action='delete']
${MSG_EXCLUIR}                    class:sc-your-amazon-cart-is-empty
${VALOR_TOTAL}                    id:sc-subtotal-amount-activecart
${VALOR_TOTAL_BOX}                id:sc-subtotal-amount-buybox
${PRECO_UM}                       css:[data-item-count='1'] .sc-product-price
${PRECO_DOIS}                     css:[data-item-count='2'] .sc-product-price         


*** Keywords ***

E a soma dos produtos deve ser igual ao valor total mostrado na pagina
    
    Wait Until Element Is Visible    ${PRECO_UM}
   
    ${COMPRA1}=                       Get WebElement                ${PRECO_UM}
    ${COMPRA2}=                       Get WebElement                ${PRECO_DOIS}
    ${VALOR_TOTAL}=                   Get WebElement                ${VALOR_TOTAL}
    ${VALOR_TOTAL_BOX}=               Get WebElement                ${VALOR_TOTAL_BOX}
   
    ${COMPRA1}=                       Get Number                    ${COMPRA1.text}
    ${COMPRA2}=                       Get Number                    ${COMPRA2.text}
    ${VALOR_TOTAL}=                   Get Number                    ${VALOR_TOTAL.text}
    ${VALOR_TOTAL_BOX}=               Get Number                    ${VALOR_TOTAL_BOX.text}

    ${SOMA_VALORES}=                  Conta                         ${COMPRA1}      ${COMPRA2}

    Should Be Equal                   ${SOMA_VALORES}               ${VALOR_TOTAL}
    Should Be Equal                   ${VALOR_TOTAL}                ${VALOR_TOTAL_BOX} 


Então devo excluir o produto do carrinho

    Click Element                     ${BOTAO_EXCLUIR} 


E ver a mensagem "${MENSAGEM}"

    Wait Until Element Is Visible    ${MSG_EXCLUIR}

    ${RESULT}=               Get WebElement                     ${MSG_EXCLUIR}

    Should Be Equal          ${RESULT.text}                     ${MENSAGEM}

Clicando no Botão Comprar

    Click Element                     ${BOTAO_COMPRA}