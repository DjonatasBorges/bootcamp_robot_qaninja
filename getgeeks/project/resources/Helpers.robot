*Settings*
Documentation       Actions of system

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Prostgres
    Insert User     ${user}
    Disconnect From Database