*** Settings ***
Suite Setup       Go to Home Page
Suite Teardown    Quit Application
Resource          ../../~DEPENDENCIES.txt


*** Test Cases ***
Add Account
    [Documentation]    Validate Add Account Functionality
    [Setup]
    Log    Home Page opened
    Click Element    id=org.gnucash.android:id/fab_create_account
    ${AccountNameTest}    Generate Random String    7    [NUMBERS] Account Name Test
    Wait Until Keyword Succeeds    10    5    Input Text    id=org.gnucash.android:id/input_account_name    ${AccountNameTest}
    Wait Until Keyword Succeeds    5    5    Click Element    id=org.gnucash.android:id/menu_save
    Wait Until Keyword Succeeds    5    5    Page Should Contain Text    ${AccountNameTest}    New Got created with name ${AccountNameTest}

Edit Account Name
    [Documentation]    Valdiate the Edit Account functionality for GNU App
    ...
    ...    | STEP | Expectation |
    ...    | Click on Edit Account | Edit account window should pop up |
    ...    | Update the Account Name with randomised text | |
    ...    | Click on Save | |
    ...    | Verify Account number is changed | Account number should be updated |
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.support.v4.widget.DrawerLayout/android.view.ViewGroup/android.support.v4.view.ViewPager/android.widget.RelativeLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.RelativeLayout/android.widget.ImageView[2]
    ${EditTest}    Generate Random String    4    [NUMBERS] Test Edit Assets
    Wait Until Keyword Succeeds    5    5    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView
    Capture Page Screenshot
    Wait Until Keyword Succeeds    5    5    Input Text    id=org.gnucash.android:id/input_account_name    ${EditTest}
    Wait Until Keyword Succeeds    5    5    Click Element    id=org.gnucash.android:id/menu_save
    Page Should Contain Text    ${EditTest}    Updated test found for Account
    Capture Page Screenshot



