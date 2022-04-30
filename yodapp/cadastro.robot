Documentation       Suite de testes do cadastro de personagens

*Settings*
Resource        base.robot
Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      correct_cad
    # Dado que acesso ao formulário de cadastro
    Click       css=a[href="/new"]
    #check-up de validação de nova página
    Wait For Elements State     css=p[class="card-header-title"]

    # Quando preencher o formulário com os dados do Mestre Yoda
    Fill Text       css=input[placeholder^="Nome"]      Mestre Yoda     #^ quer dizer que o elemento começa com esse texto
    Fill Text       css=input[placeholder*="ail"]       yoda@jedi.com      # * quer dizer que contem o texto
    Select Options By       css=.ordem select           text           Jedi 
    Click           xpath=//input[@value='Cavaleiro Jedi']/..//span[@class="check"]
    Select Birth date       8-julho-1990
    Fill Text       css=input[placeholder$="gram"]      @yoda       # $ quer dizer que termina com o texto
    Click           xpath=//input[@name="comunications"]/..//span[@class="check"]

    Click            css=button >> text=Cadastrar

    #Sleep       3
    #${html}         Get Page Source
    #Log             ${html}

    # Então o Cadastro dever ter sido executado com sucesso
    Get Text        css=.toast      ==      Usuário cadastrado com sucesso!

Email Incorreto
    [Tags]      inc_email
    # Dado que acesso ao formulário de cadastro
    Click       css=a[href="/new"]
    #check-up de validação de nova página
    Wait For Elements State     css=p[class="card-header-title"]

    # Quando preencher o formulário com os dados do Mestre Yoda
    Fill Text       css=input[placeholder^="Nome"]      Darth Vader     #^ quer dizer que o elemento começa com esse texto
    Fill Text       css=input[placeholder*="ail"]       vader$hotmail.com      # * quer dizer que contem o texto
    Select Options By       css=.ordem select           text           Sith 
    Select Birth date       8-julho-1990
    Fill Text       css=input[placeholder$="gram"]      @vader       # $ quer dizer que termina com o texto
    Click           xpath=//input[@name="comunications"]/..//span[@class="check"]

    Click            css=button >> text=Cadastrar

    #Sleep       3
    #${html}         Get Page Source
    #Log             ${html}

    # Então o Cadastro dever ter sido executado sem sucesso
    Get Text        css=.toast      ==      Oops! O email é incorreto.

*Keywords*
Select Birth date
    [Arguments]     ${text_date}
    @{date}         Split String        ${text_date}    -
    Click           css=input[placeholder^="Data"]
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]   text    ${date}[1] 
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]   text    ${date}[2]
    Click                   xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[0]"]