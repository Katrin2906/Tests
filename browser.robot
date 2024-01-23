*** Settings ***
Library    String
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${url}    https://ru.wikipedia.org/wiki/Азбука Морзе
${browser}    chrome

*** Test Cases ***
making dictionary
    #//td[contains(text(),'Weight')]/following-sibling::td — Извлечение данных из ячеек таблиц
    #//tbody/tr/td[count(//tbody/tr/th[contains(., "Brand Name")]/preceding-sibling::th) + 1]
    #Set To Dictionary  ${dictionary_data}  ${key}=${element_list}
    Open Browser    ${url}    ${browser}     options=add_experimental_option("detach", True)
    Maximize Browser Window
    &{new dict}    Create Dictionary
    FOR    ${i}    IN RANGE    1    33
        ${letters value}    Get Text     (//tbody[1]/tr/td[1])[${i}]
        ${melody value}    Get Text    (//tbody[1]/tr/td[4])[${i}]
        Set To Dictionary    ${new dict}    ${letters value}=${melody value}
    END
    Log To Console    ${new dict}
    [Teardown]    Close Browser

*** Keywords ***

