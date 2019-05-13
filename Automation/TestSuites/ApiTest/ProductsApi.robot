*** Settings ***
Documentation     This suite contains Test cases for product endpoint.
...
...               Covers following :
...
...               | Creates New Product |
...               | Gets all products |
...               | Gets particular product |
...               | Updates particular Product |
...               | Deletes particular product |
Force Tags        products
Default Tags      smoke
Resource          ../../~DEPENDENCIES.txt

*** Test Cases ***
EndtoEndtestcase
    [Documentation]    Validate to Add product, get the product with created id, update product and delete product
    [Tags]    products
    Create Http Context    ${Host}    ${Verb}
    Set Header
    Set Request Body    ${Body}
    HttpLibrary.HTTP.POST    ${ProductsUri}
    Verify Response    201
    ${Response}    Get Response
    Response Body Should Contain    "name":"Trupti"
    ${Orderid}    get json value    ${Response}    /id
    HttpLibrary.HTTP.GET    ${ProductsUri}/${Orderid}
    Verify Response    200
    ${Response}    Get Response
    Response Body Should Contain    "id":${Orderid}
    Set Request Body    ${Body}
    HttpLibrary.HTTP.PUT    ${ProductsUri}/${Orderid}
    Verify Response    200
    ${Response}    Get Response
    HttpLibrary.HTTP.Delete    ${ProductsUri}/${Orderid}
    Verify Response    200
    ${Response}    Get Response
    Run Keyword And Ignore Error    HttpLibrary.HTTP.Delete    ${ProductsUri}/${Orderid}
    Verify Response    404
    ${Response}    Get Response
    Response Body Should Contain    "message":"No record found for id '${Orderid}'"


PostProduct400
    [Documentation]    Validate POST request for 400 response code passing invalid parameters
    Create Http Context    ${Host}    ${Verb}
    Set Header
    Set Request Body    ${InvalidBody}
    Run Keyword And Ignore Error    HttpLibrary.HTTP.POST    ${ProductsUri}
    Verify Response    400
    ${Response}    Get Response
    Response Body Should Contain    "message":"Invalid Parameters"

PostProduct201
    [Documentation]    Validate that new record gets created by calling POST method.
    ...
    ...    Expected:
    ...    | Response Code | 201 |
    ...    | Response Message | Product Id of newly added records |
    Create Http Context    ${Host}    ${Verb}
    Set Header
    Set Request Body    ${Body}
    HttpLibrary.HTTP.POST    ${ProductsUri}
    Verify Response    201
    ${Response}    Get Response
    Response Body Should Contain    "name":"Trupti"
    ${Orderid}    get json value    ${Response}    /id

Verify200responseforGetAllProducts
    [Documentation]    Validate 200 response for successfully getting all the records
    Create Http Context    ${Host}    ${Verb}
    HttpLibrary.HTTP.GET    ${ProductsUri}
    Set Header
    Verify Response    200
    ${Response}    Get Response

GetProductswithProductid
    [Documentation]    Test case to Verify get method endpoint for Products service.
    ...
    ...    Expected: Response should contain product with parameter passed
    Create Http Context    ${Host}    ${Verb}
    Set Header
    HttpLibrary.HTTP.GET    ${ProductsUri}/${Productid}
    Verify Response    200
    ${Response}    Get Response
    Response Body Should Contain    "id":${Productid}

Validate500Response
    [Documentation]    Validates the response code when invalid parameter is passed.
    ...
    ...    Expected: 500 Internal server response
    Create Http Context    ${Host}    ${Verb}
    Set Header
    Run Keyword And Ignore Error    HttpLibrary.HTTP.GET    ${ProductsUri}?$limit=xyz
    Verify Response    500
    ${Response}    Get Response

DeleteProductresponse404
    [Documentation]    Validate user gets error response code when *DELETE* method is called for non existent product ID
    ...
    ...    Expected:
    ...
    ...    | Response Code | 404 |
    ...    | Response Message | No Records Found for _ID_ |

    Create Http Context    ${Host}    ${Verb}
    Run Keyword And Ignore Error    HttpLibrary.HTTP.Delete    ${ProductsUri}/1
    Verify Response    404
    ${Response}    Get Response
    Response Body Should Contain    "message":"No record found for id '1'"

