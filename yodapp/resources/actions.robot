*Settings*
Documentation       Ações customizadas do Yodapp
Resource            base.robot


*Keywords*
Go To Home Page
    Go To           ${BASE_URL}
    Wait For Elements State         css=.carousel      visible     5


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
    ${element}      Set Variable        css=.toast div
    Wait For Elements State         ${element}      visible     5
    Get Text         ${element}      equal      ${expected_message}

Select Birth date
    [Arguments]             ${text_date}
    @{date}                 Split String                        ${text_date}                  -
    Click                   css=input[name="Data de nascimento"]
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]   text    ${date}[1] 
    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]   text    ${date}[2]
    Click                   xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[0]"]

User Should Be visible
    [Arguments]     ${user}
    
    ${element}      Set Variable        css=.table tr:nth-child(2)
    Wait For Elements State     ${element}      visible     5
    Get Text        ${element}      contains    ${user}[name]   
    Get Text        ${element}      contains    ${user}[email]
    Get Text        ${element}      contains    ${user}[instagram]
