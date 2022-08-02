*Settings*

Documentation       Shared Actions

*Keywords*
Modal Content Should Be
    [Arguments]     ${expected_text}

    ${found_title}              Set Variable          css=.swal2-title

    Wait For Elements State     ${found_title}        visible     5
    Get Text                    ${found_title}        equal       Oops...

    ${found_text}               Set Variable         css=.swal2-html-container

    Wait For Elements State     css=.swal2-html-container    visible     5
    Get Text                    ${found_text}                equal       ${expected_text}

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
