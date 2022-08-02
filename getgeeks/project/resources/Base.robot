*Settings*
Documentation       Base Test

Library     Browser
Library     Collections

Library     factories/Users.py

Resource    actions/_SharedActions.robot
Resource    actions/BeGeekActions.robot
Resource    actions/LoginActions.robot
Resource    actions/SignupActions.robot

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
