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