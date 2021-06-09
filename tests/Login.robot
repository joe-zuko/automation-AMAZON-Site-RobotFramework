*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/variables/users.robot
Resource            ../resources/variables/alertas.robot
Resource            ../resources/pages/login_page.robot
Test Setup          Abrir pagina login
Test Teardown       Fechar navegador


*** Test Case ***
Login
    [tags]      login
    login_page.Fazendo login com "${MY_AMAZON_USER}" e "${MY_AMAZON_PASS}"
    login_page.Devo ver a mensagem "${WELCOME}" na área logada 

Senha Errada
    [tags]      wrong_pass
    login_page.Fazendo login com "${MY_AMAZON_USER}" e "${WRONG_PASS}"
    login_page.Devo receber o alerta "${MSG_WRONG_PASS}" 

Senha em Branco
    [tags]      empty_pass
    login_page.Fazendo login com "${MY_AMAZON_USER}" e "${NO_PASS}"
    login_page.Devo ver a mensagem "${EMPTY_PASS}" 

Email em Branco
    [tags]      empty_email
    login_page.Postando o user "${NO_USER}"
    login_page.Devo ver o aviso "${EMPTY_EMAIL}" 

Usuario Errado
    [tags]      wrong_user
    login_page.Postando o user "${WRONG_USER}"
    login_page.Devo receber o alerta "${WRONG_USER_ALERT}" 
    