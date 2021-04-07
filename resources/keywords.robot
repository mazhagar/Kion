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
     Run Keyword If     '${state}' == 'userlogin'
     ...                UserLogin
     SiteLogin
    Setup Browser
    HotKey                          ctrl    shift    N
    QWeb.SwitchWindow               NEW
    QWeb.GoTo                       ${Site_Base_URL}
    QWeb.TypeText                   DefaultUserLogin_Login        ${site_login}
    QWeb.TypeSecret                 DefaultUserLogin_Password     ${site_pass}
    QWeb.VerifyNoText               Please enter an e-mail address.
    QWeb.VerifyNoText               Please enter a password.
    QWeb.VerifyNoText               Please enter a valid e-mail address.
    QWeb.VerifyNoText               Your e-mail/password combination is incorrect. Please try again.
    QWeb.ClickText                  Log In        

UserLogin 
    [Arguments]                   ${user_login}    ${user_pass}
    QWeb.Appstate                 SiteLogin
    QWeb.ClickText                Login
    QWeb.TypeText                 ShopLoginForm_Login        ${user_login}
    QWeb.TypeSecret               ShopLoginForm_Password     ${user_pass}
    QWeb.VerifyNoText             Please enter an e-mail address.
    QWeb.VerifyNoText             Please enter a password.
    QWeb.VerifyNoText             Please enter a valid e-mail address.
    QWeb.VerifyNoText             Your e-mail/password combination is incorrect. Please try again.
    QWeb.ClickText                SIGN IN
    QWeb.VerifyText               Welcome back!  
