*Settings*
Documentation       Actions of system

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Prostgres
    Insert User     ${user}
    Disconnect From Database

Do Login
    [Arguments]         ${user}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}
