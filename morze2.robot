*** Settings ***
Library    BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    SeleniumLibrary

*** Variables ***
${url}    https://ru.wikipedia.org/wiki/Азбука Морзе
${browser}    chrome
${table_row_pattern}    //tbody//following-sibling::tr[number]
${first_column_value_pattern}    (//tbody//following-sibling::tr)[number]/td[1]
${fourth_column_value_pattern}    (//tbody//following-sibling::tr)[number]/td[4]

*** Test Cases ***
1. Test1
    Open Browser    ${url}    ${browser}     options=add_experimental_option("detach", True)
    Maximize Browser Window
    Page Should Contain Element    //table[contains(@class, "wikitable")]
    &{new dict}    Create Dictionary
    FOR    ${i}    IN RANGE    33    43
        ${number}     Get Text    (//tbody[1]/tr/td[1])[${i}]
        ${kod}     Get Text       (//tbody//tr)[${i}]/td[2]/span
        ${melody}    Get Text       (//tbody//tr)[${i}]/td[3]
        ${union}    Catenate    ${kod}    ${melody}
        Set To Dictionary    ${new dict}    ${number}=${union}
    END
    Log Dictionary    ${new dict}
    [Teardown]    Close Browser

*** Keywords ***

