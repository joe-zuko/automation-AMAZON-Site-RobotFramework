*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${EMAIL_FIELD}         css:input[name='email']
${PASS_FIELD}          id:ap_password
${WELCOME_FIELD}       id:nav-link-accountList-nav-line-1
${ALERTA_FALHOU}       css:.a-list-item
${EMAIL_BRANCO}        id:auth-email-missing-alert
${SENHA_VAZIA}         id:auth-password-missing-alert


*** Keywords ***

#Login
Fazendo login com "${AMAZON_USER}" e "${AMAZON_PASS}"

    Wait Until Element Is Visible    ${EMAIL_FIELD}

    Input Text                       ${EMAIL_FIELD}    ${AMAZON_USER}       
    Press Keys                       ${EMAIL_FIELD}    ENTER

    Input Text                       ${PASS_FIELD}     ${AMAZON_PASS}      
    Press Keys                       ${PASS_FIELD}     ENTER
 
#Usuario Vazio
Postando o user "${EMPTY_USER}"

    Wait Until Element Is Visible    ${EMAIL_FIELD}

    Input Text                       ${EMAIL_FIELD}    ${EMPTY_USER}      
    Press Keys                       ${EMAIL_FIELD}    ENTER

    
#Alerta Password Errado
Devo receber o alerta "${MSG_WRONG_PASS}" 

    Wait Until Element Is Visible    ${ALERTA_FALHOU}  

    ${RESULT}=               Get WebElement                     ${ALERTA_FALHOU} 

    Should Be Equal          ${RESULT.text}                     ${MSG_WRONG_PASS}


#Alerta E-mail em Branco
Devo ver o aviso "${MSG_WRONG_PASS}" 

    Wait Until Element Is Visible    ${EMAIL_BRANCO}  

    ${RESULT}=               Get WebElement                     ${EMAIL_BRANCO} 

    Should Be Equal          ${RESULT.text}                     ${MSG_WRONG_PASS}

#Senha vazia
Devo ver a mensagem "${MSG_WRONG_PASS}" 

    Wait Until Element Is Visible    ${SENHA_VAZIA}  

    ${RESULT}=               Get WebElement                     ${SENHA_VAZIA}  

    Should Be Equal          ${RESULT.text}                     ${MSG_WRONG_PASS}

#Bem vindo area logada
Devo ver a mensagem "${WELCOME}" na área logada

    Wait Until Element Is Visible    ${WELCOME_FIELD}  

    ${RESULT}=               Get WebElement                     ${WELCOME_FIELD}   

    Should Be Equal          ${RESULT.text}                     ${WELCOME}