*** Settings ***
Documentation     This suite contains Test cases related to service healthcheck
Force Tags        healthcheck
Resource          ../../~DEPENDENCIES.txt

*** Test Cases ***
VerifyVersion
    [Documentation]    Validates the version
    [Tags]    Test    smoke
    Create Http Context    ${Host}    ${Verb}
    HttpLibrary.HTTP.GET    ${VersionUri}
    Set Header
    Verify Response    200
    ${Response}    Get Response
    Response Body Should Contain    "version":"1.1.0"

VerifyhealthCheck
    [Documentation]    Validiate if Server is up
    [Tags]    Test    healthcheck    smoke
    Create Http Context    ${Host}    ${Verb}
    HttpLibrary.HTTP.GET    ${healthcheckUri}
    Set Header
    Verify Response    200
    ${Response}    Get Response
    Response Body Should Contain    products":51959
