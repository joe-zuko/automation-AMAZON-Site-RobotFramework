*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}          https://www.amazon.com.br
${BROWSER}      chrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        ${URL}   ${BROWSER}
    Set Window Size 	1400	 800	

Fechar navegador
    Capture Page Screenshot
    Close Browser

Abrir pagina login
    Open Browser        ${URL}/login      ${BROWSER}
    Set Window Size 	1400	 800