*Settings*
Documentation       Suíte de testes para verificar se o app está online

Library             Browser



*Test Cases*
Yodapp deve estar online

    New Browser         chromium        headless=False      slowMo=00:00:01
    New Page            https://yodapp.vercel.app/

    Get Title           equal       Yodapp | QAninja

    Take Screenshot