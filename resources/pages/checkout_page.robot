*** Settings ***
Library    SeleniumLibrary
Library    ../libs/conta.py

*** Variables ***

${BOTAO_ENDERECO}                  css:.a-spacing-medium.a-button .a-button-inner
${BOTAO_ENTREGA}                   css:.a-last
${BOTAO_CONTINUAR}                 xpath://*[@id='shippingOptionFormId']/div[3]/div/div/span[1]/span/input
${BOTAO_BOLETO}                    css:label [type='radio']
${BOTAO_CONTINUAR2}                xpath:/html/body/div[5]/div[1]/div[2]/div[2]/div/div[2]/div[1]/form/div[2]/div/div/div/span/span/input
${BOTAO_CONFIRMAR_PEDIDO}          id:placeYourOrder input[title='Confirmar pedido']
${PEDIDO_TOTAL}                    css:.grand-total-price
${PEDIDO_VALOR}                    xpath://*[@id='subtotals-marketplace-table']/tbody/tr[1]/td[2]
${FRETE_VALOR}                     xpath://*[@id='subtotals-marketplace-table']/tbody/tr[2]/td[2]
${DESCONTO_PRODUTO}                xpath://*[@id='subtotals-marketplace-table']/tbody/tr[4]/td[2]
  
   

*** Keywords ***

Finalizando Compra
    
    Click Element                   ${BOTAO_ENDERECO} 
    Click Element                   ${BOTAO_ENTREGA} 
    Click Element                   ${BOTAO_CONTINUAR} 

    Wait Until Element Is Visible   ${BOTAO_BOLETO}     10
    Click Element                   ${BOTAO_BOLETO} 

    Click Element                   ${BOTAO_CONTINUAR2} 
     
    Wait Until Element Is Visible   ${PEDIDO_TOTAL}     10 
   
    ${PEDIDO_VALOR}=                  Get WebElement                ${PEDIDO_VALOR} 
    ${FRETE_VALOR}=                   Get WebElement                ${FRETE_VALOR}
    ${PEDIDO_TOTAL}=                  Get WebElement                ${PEDIDO_TOTAL}
        
    ${PEDIDO_VALOR}=                  Get Number                    ${PEDIDO_VALOR.text}
    ${FRETE_VALOR}=                   Get Number                    ${FRETE_VALOR.text}
    ${PEDIDO_TOTAL}=                  Get Number                    ${PEDIDO_TOTAL.text}
    

    ${SOMA_VALORES}=                  Conta                         ${PEDIDO_VALOR}      ${FRETE_VALOR}

    Should Be Equal                   ${SOMA_VALORES}               ${PEDIDO_TOTAL}
    