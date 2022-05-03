*Settings*
Documentation       Ações customizadas do Yodapp

*Keywords*
Go To User Form
    Click       css=a[href="/new"]
    Wait For Elements State       css=p[class="card-header-title"]


Fill User Form 
    [Arguments]         ${name}     ${email}     ${ordem}   ${bdate}    ${instagram}

    #Fill Text            css=input[placeholder^="Nome"]      ${name}     #^ quer dizer que o elemento começa com esse texto
    #Fill Text            css=input[placeholder*="ail"]       ${email}      # * quer dizer que contem o texto
    Fill Text            css=input[name="nome"]      ${name}
    Fill Text            css=input[name="email"]     ${email}

    Select Options By    css=.ordem select           text           ${ordem} 

    Select Birth date    ${bdate}

    Fill Text            id=insta      ${instagram}

Select Jedi
    [Arguments]         ${tpjedi}

    Click                xpath=//input[@value="${tpjedi}"]/..//span[@class="check"]

Check Accept Comunications
    [Arguments]     
    Click                xpath=//input[@name="comunications"]/..//span[@class="check"]

Submit User Form
    Click                css=button >> text=Cadastrar

Toaster Message Should Browser
    [Arguments]     ${expected_message}
    Get Text        css=.toast      ==      ${expected_message}

Select Birth date
    [Arguments]             ${text_date}
    @{date}                 Split String                        ${text_date}                  -
    Click                   css=input[name="Data de nascimento"]
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]   text    ${date}[1] 
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]   text    ${date}[2]
    Click                   xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[0]"]
