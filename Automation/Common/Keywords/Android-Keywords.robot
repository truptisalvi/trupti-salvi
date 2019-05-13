*** Settings ***
Resource          ../../~DEPENDENCIES.txt

*** Variables ***
${BROWSER OPEN}    'CLOSED'

*** Keywords ***

Launch App
    Run Keyword If    '${Login_Type}'=='LOCAL'    Launch GNu Application


Go to Home Page
    Open Application    ${REMOTE_URL}    app=${app}    platformName=${platformName}    deviceName=${deviceName}    automationName=${automationName}    appActivity=${appActivity}
    ...    appPackage=${appPackage}
    # id=org.gnucash.android:id/btn_save
    Click Element    id=org.gnucash.android:id/btn_save
    # xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v4.view.ViewPager/android.widget.LinearLayout/android.widget.ListView/android.widget.CheckedTextView[4]
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v4.view.ViewPager/android.widget.LinearLayout/android.widget.ListView/android.widget.CheckedTextView[4]
    # id=org.gnucash.android:id/btn_save
    Click Element    id=org.gnucash.android:id/btn_save
    # id=org.gnucash.android:id/btn_save
    Click Element    id=org.gnucash.android:id/btn_save
    # xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v4.view.ViewPager/android.widget.LinearLayout/android.widget.ListView/android.widget.CheckedTextView[2]
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v4.view.ViewPager/android.widget.LinearLayout/android.widget.ListView/android.widget.CheckedTextView[2]
    # id=org.gnucash.android:id/btn_save
    Click Element    id=org.gnucash.android:id/btn_save
    # id=org.gnucash.android:id/btn_save
    Click Element    id=org.gnucash.android:id/btn_save
    # id=android:id/button1
    Wait Until Keyword Succeeds    10    5    Click Element    id=android:id/button1















