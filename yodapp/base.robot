Documentation       Este arquivo não é uma suite, ele é o arquivo base.

*Settings*
Library     Browser


*Keywords*
Start Session
    New Browser         chromium        headless=False      slowMo=00:00:01
    New Page            https://yodapp.vercel.app/

End Session
    Take Screenshot