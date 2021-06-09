import re
from robot.api.deco import keyword
from selenium import webdriver

@keyword(name='Get_Number')
def get_number(frase):
      
    retirar_letras = re.sub("[a-zA-Z$ ]", "" , frase)
    valor_float = re.sub(",", "." , retirar_letras)
    
    return float(valor_float)
    
@keyword(name='Conta')
def somar (n1, n2):
    
    resultado = n1 + n2
    resultado = str("%.2f" % resultado)

    return float(resultado)

