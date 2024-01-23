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

    @{letters list}    Create List
    @{melody list}     Create List
    FOR    ${i}    IN RANGE    1    33
        ${letters value}    Get Text     (//tbody/tr/td[contains(text(),"Русский символ")]/following-sibling::td)[${i}]
        ${melody value}    Get Text    (//tbody/tr/td[contains(text(),"Напевы")]/following-sibling::td)[${i}]
    Append To List    ${letters list}    ${letters value}
    Append To List    ${melody list}    ${melody value}
    END
    Log Many           ${letters list}
    Log Many        ${melody list}
    
    &{new dict}    Create Dictionary
    ${new dict}    Set To Dictionary    ${new dict}    ${letters list}=${melody list}
         Log To Console    ${new dict}

    Log Many    ${new dict}
    [Teardown]    Close Browser

*** Keywords ***

