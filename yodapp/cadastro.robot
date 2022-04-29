Documentation       Suite de testes do cadastro de personagens

*Settings*
Resource        base.robot
Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    Click       css=a[href="/new"]

    #check-up de validação de nova página
    Wait For Elements State     css=p[class="card-header-title"]

    Fill Text       css=input[placeholder^="Nome"]      Mestre Yoda     #^ quer dizer que o elemento começa com esse texto
    Fill Text       css=input[placeholder*="ail"]       yoda@jedi.com      # * quer dizer que contem o texto
    Fill Text       css=input[placeholder$="gram"]      @yoda       # $ quer dizer que termina com o texto