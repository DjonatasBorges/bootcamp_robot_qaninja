Documentation       Suite de testes do cadastro de personagens

*Settings*
Library         ${EXECDIR}/resources/factories/user.py
Resource        ${EXECDIR}/resources/base.robot
Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      correct_cad

    ${user}     Factory Mestre Yoda

    Go To User Form
    Fill User Form      ${user}[name]  ${user}[email]  ${user}[ordem]  ${user}[bdate]  ${user}[instagram]
    Select Jedi         ${user}[tpjedi]
    Check Accept Comunications
    Submit User Form
    Toaster Message Should Browser      Usuário cadastrado com sucesso!
    Go To Home Page
    User Should Be visible      ${user}
    #Sleep       3
    #${html}         Get Page Source
    #Log             ${html}

Email Incorreto
    [Tags]      inc_email

    ${user}     Factory Darth Vader

    Go To User Form
    Fill User Form   ${user}[name]  ${user}[email]  ${user}[ordem]  ${user}[bdate]  ${user}[instagram]
    Check Accept Comunications  
    Submit User Form
    Toaster Message Should Browser  Oops! O email é incorreto.