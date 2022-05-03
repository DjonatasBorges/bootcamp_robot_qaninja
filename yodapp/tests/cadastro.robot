Documentation       Suite de testes do cadastro de personagens

*Settings*
Resource        ${EXECDIR}/resources/base.robot
Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      correct_cad
    
    Go To User Form
    Fill User Form      Mestre Yoda  yoda@jedi.com  Jedi  8-julho-1990  @yoda
    Select Jedi         Cavaleiro Jedi
    Check Accept Comunications
    Submit User Form
    Toaster Message Should Browser      Usuário cadastrado com sucesso!
    #Sleep       3
    #${html}         Get Page Source
    #Log             ${html}

Email Incorreto
    [Tags]      inc_email

    Go To User Form
    Fill User Form   Darth Vader  veder$hotmail.com  Sith  25-dezembro-1990  @vader
    Check Accept Comunications  
    Submit User Form
    Toaster Message Should Browser  Oops! O email é incorreto.