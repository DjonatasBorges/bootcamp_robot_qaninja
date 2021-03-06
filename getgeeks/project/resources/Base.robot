*Settings*
Documentation       Base Test

Library     Browser
Library     factories/Users.py

Resource    Actions.robot
Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}         https://getgeeks-djonatas.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium        headless=False
    New Page        ${BASE_URL}  

Finish Session
    Take Screenshot
    Close Browser