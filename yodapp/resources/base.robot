Documentation       Este arquivo não é uma suite, ele é o arquivo base.

*Settings*
Library     Browser
Library     String

Resource    actions.robot

*Variables*
${BASE_URL}             https://yodapp-testing.vercel.app/

*Keywords*
Start Session
    New Browser         chromium        headless=False      slowMo=00:00:01
    New Page            ${BASE_URL}

End Session
    Take Screenshot