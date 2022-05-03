*Settings*
Documentation       Suíte de testes para verificar se o app está online
Resource            ${EXECDIR}/resources/base.robot
Test Setup          Start Session
Test Teardown       End Session



*Test Cases*
Yodapp deve estar online
    Get Title           equal       Yodapp | QAninja

Deve exibir mensagens de boas vindas
    Wait For Elements State    id=welcome      visible     5

    Get Text        id=welcome      ==      Que a Força (qualidade) esteja com você!

