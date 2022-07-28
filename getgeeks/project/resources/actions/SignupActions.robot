*Settings*
Documentation       Signup Actions

*Keywords*
Go To Signup Form
    Go To    ${BASE_URL}/signup
    Wait For Elements State     css=.signup-form    visible     10  

Fill Signup Form
    [Arguments]     ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit Signup Form
    Click       css=.submit-button >> text=Cadastrar

User Should Be Registered
    ${expected_message}     Set Variable        Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
    ${locator_message}      Set Variable        css=p
    Get Text        ${locator_message}      ==       ${expected_message}

Alert Span Should Be
    [Arguments]     ${expected_alert}

    ${found_alert}       Set Variable                css=span[class="error"] >> text=${expected_alert}
    Wait For Elements State      ${found_alert}       visible     5

    Get Text                    ${found_alert}   equal       ${expected_alert}

Alert Spans Should Be
    [Arguments]     ${expected_alerts}

    @{found_alerts}     Create List

    @{alerts} =       Get Elements      css=.error

    FOR     ${a}       IN      @{alerts}

        ${alert} =          Get Text            ${a}
        Append To List      ${found_alerts}     ${alert}
    
    END

    Lists Should Be Equal       ${expected_alerts}      ${found_alerts}
