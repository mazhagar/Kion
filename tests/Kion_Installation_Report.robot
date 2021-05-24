*** Settings ***
Resource            ../resources/keywords.robot
 #Suite Setup         Setup Browser
Suite Teardown      End suite

*** Test Cases ***
User and Admin Login
    [Documentation]                            Login to User and Admin account
    [Tags]                                     Admin    User
    UserLogin
    SiteLogin
