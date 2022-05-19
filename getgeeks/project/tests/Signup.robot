*Settings*
Documentation       Signup Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session 
Test Teardown       Finish Session 

*Test Cases*
Register a new user

    ${user}     Factory User

    Set Suite Variable    ${user}  #seta esse usuário para as demais suites

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user
    [Tags]          dup_email

    ${user}                     Factory User
    Add User From Database      ${user}

    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Modal Content Should Be     Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]          wrong_mail

    ${user}                 Factory Wrong Email
    Go To Signup Form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be     O email está estranho


Required Fields
    [Tags]      rfields
    Go To Signup Form
    Submit Signup Form
    Alert Span Should Be     Cadê o seu nome?
    Alert Span Should Be     E o sobrenome?
    Alert Span Should Be     O email é importante também!
    Alert Span Should Be     Agora só falta a senha!
