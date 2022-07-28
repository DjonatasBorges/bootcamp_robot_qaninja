*Settings*
Documentation       Login test suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login
    ${user}     Factory User Login
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]      incorrect_pass
    ${user}     Create Dictionary       email=djonatas@qaninja.com.br       password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

User Not Found
    [Tags]      user_404
    ${user}     Create Dictionary       email=djonatas@asdf.com.br       password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      incorrect_email
    ${user}     Create Dictionary       email=djonatas.com.br       password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Should Be Type Email

# Dasafio: Criar 3 cenários de Teste - Email Obrigatório, Senha Obrigatória e Campos Obrigatórios

Required email
    [Tags]      required_email
    ${user}     Create Dictionary     email=${EMPTY}    password=abc123
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    E-mail obrigatório

Required password
    [Tags]      required_password
    ${user}     Create Dictionary              email=djonatas@qa.com.br     password=${EMPTY}
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    Senha obrigatória

Required fields
    [Tags]      required_fields

    @{expected_alerts}      Create List     
    ...                     E-mail obrigatório     
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be   ${expected_alerts}

# Desafio Resolvido