*** Settings ***
Resource          ../../~DEPENDENCIES.txt
Library           JSONLibrary

*** Keywords ***


Set Header
    Set Request Header       Content Application    application/json

Verify Response
    [Arguments]     ${Code}
    ${Status}    Get Response Status
    Should Start With  ${Status}       ${Code}
    #Response Status Code Should Equal     201

Get Response
      ${Response}      Get Response Body
      log   ${Response}
      Return from keyword    ${Response}

















