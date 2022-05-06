*Settings*
Documentation       Base Test

Library     Browser
Library     factories/Users.py

Resource    Actions.robot

*Keywords*
Start Session
    New Browser     chromium        headless=False
    New Page        https://getgeeks-djonatas.herokuapp.com/    

Finish Session
    Take Screenshot
    Close Browser