*** Settings ***
Resource            ../resources/keywords.robot
 #Suite Setup         Setup Browser
Suite Teardown      End suite

*** Test Cases ***
Boost Product by PLP Navigation
    [Documentation]                            To boost the Facet using the PLP Navigation
    [Tags]                                     ART    PLPNav
    UserLogin                                  ${user_login1}    ${user_pass1}
    ProductBoostUsingPLPNavigation
    UserLogin                                  ${user_login2}    ${user_pass2}
    ProductBoostUsingPLPNavigation
    UserLogin                                  ${user_login3}    ${user_pass3}
    ProductBoostUsingPLPNavigation
    UserLogin                                  ${user_login4}    ${user_pass4}
    ProductBoostUsingPLPNavigation
    UserLogin                                  ${user_login5}    ${user_pass5}
    ProductBoostUsingPLPNavigation
