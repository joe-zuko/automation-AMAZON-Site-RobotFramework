*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/pages/barra_de_busca.robot
Resource            ../resources/pages/produto_page.robot
Resource            ../resources/pages/resultados_page.robot
Resource            ../resources/pages/carrinho_page.robot
Resource            ../resources/pages/checkout_page.robot
Resource            ../resources/pages/login_page.robot
Resource            ../resources/variables/users.robot
Resource            ../resources/variables/tests_var.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Adicionar Produtos ao Carrinho
    [tags]      add_produto
    barra_de_busca.Barra de Busca      ${PRODUTO_1} 
    resultados_page.Clicando em "${PRODUTO_1}" para ver os detalhes do produto
    resultados_page.Adicionando produto e mais "Akira - Vol. 06" ao carrinho
    carrinho_page.E a soma dos produtos deve ser igual ao valor total mostrado na pagina


Excluir Produtos do Carrinho
    [tags]      excluir
    barra_de_busca.Barra de Busca      ${PRODUTO_2}
    resultados_page.Clicando em "${PRODUTO_2}" para ver os detalhes do produto
    resultados_page.Adicionando produto ao carrinho
    carrinho_page.Então devo excluir o produto do carrinho
    carrinho_page.E ver a mensagem "${FRASE_1}"

Busca não retorna nada 
    [tags]      busca_null
    barra_de_busca.Barra de Busca      ${FRASE_2}
    Então vejo a mensagem "${FRASE_3}"

Compra com Boleto
    [tags]      boleto
    [Setup]     Abrir pagina login
    login_page.Fazendo login com "${MY_AMAZON_USER}" e "${MY_AMAZON_PASS}"
    barra_de_busca.Barra de Busca      ${PRODUTO_3}
    resultados_page.Clicando em "${PRODUTO_3}" para ver os detalhes do produto
    resultados_page.Adicionando produto ao carrinho
    carrinho_page.Clicando no Botão Comprar
    checkout_page.Finalizando Compra
    
    