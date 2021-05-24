*** Settings ***
Library                QWeb
# Suitable libraries as per the use case
Library                String
Library                QVision

*** Variables ***
${BROWSER}                chrome
${Site_Base_URL}


*** Keywords ***
Setup Browser
     Open Browser       about:blank    ${BROWSER}

End suite
     Close All Browsers

Appstate
     [Documentation]    AppState handler
     [Arguments]        ${state}
     ${state}=          Convert To Lowercase    ${state}
     Run Keyword If     '${state}' == 'sitelogin'
     ...                SiteLogin
     Run Keyword If     '${state}' == 'adminuserlogin'
     ...                AdminUserLogin
SiteLogin
    Setup Browser
    
    GoTo                       ${Site_Base_URL}
    TypeText                   DefaultUserLogin_Login        ${site_login}
    TypeSecret                 DefaultUserLogin_Password     ${site_pass}
    VerifyNoText               Please enter an e-mail address.
    VerifyNoText               Please enter a password.
    VerifyNoText               Please enter a valid e-mail address.
    VerifyNoText               Your e-mail/password combination is incorrect. Please try again.
    ClickText                  Log In        

AdminUserLogin 
    [Arguments]                   ${user_login}    ${user_pass}
    
    ClickText                Login
    TypeText                 ShopLoginForm_Login        ${user_login}
    TypeSecret               ShopLoginForm_Password     ${user_pass}
    VerifyNoText             Please enter an e-mail address.
    VerifyNoText             Please enter a password.
    VerifyNoText             Please enter a valid e-mail address.
    VerifyNoText             Your e-mail/password combination is incorrect. Please try again.
    ClickText                SIGN IN
    VerifyText               Welcome back!   
