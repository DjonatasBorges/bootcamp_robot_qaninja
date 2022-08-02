*Settings*
Documentation       Be Geek Test Suit

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Be a Geek
    ${user}     Factory User    be_geek

    Do Login    ${user}
    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
