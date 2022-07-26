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

    @{expected_alerts}      Create List
    ...     Cadê o seu nome?
    ...     E o sobrenome?
    ...     O email é importante também!
    ...     Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be       ${expected_alerts}


Short password
    [Tags]      short_pass
    [Template]  Signup With Short Password
    1
    12
    123
    1234
    12345
    a
    a1
    a23
    abc4
    abc45

***Keywords***
Signup With Short Password
    [Arguments]     ${short_pass}

    ${user}     Create Dictionary
    ...         name=Fernando               lastname=Papito
    ...         email=papito@hotmail.com    password=${short_pass}

    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres
