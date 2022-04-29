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

    Select Options By       css=.ordem select           text           Jedi 
    Select Birth date       8                           julho          1990

    Fill Text       css=input[placeholder$="gram"]      @yoda       # $ quer dizer que termina com o texto

*Keywords*
Select Birth date
    [Arguments]     ${dia}      ${mes}          ${ano} 
    Click           css=input[placeholder^="Data"]
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]   text    ${mes} 
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]   text    ${ano} 
    Click                   xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${dia}"]