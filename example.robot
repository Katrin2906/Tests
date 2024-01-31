*** Settings ***
Library   Collections

*** Keywords ***
FOR-IN-ZIP
    [Arguments]    ${NUMBERS}    ${NAMES}
    Log List    ${NUMBERS}    level=INFO
    Log List    ${NAMES}
    FOR    ${number}    ${name}    IN ZIP    ${NUMBERS}    ${NAMES}
        Log To Console        ${number}    ${name}
    END

*** Test Cases ***
Test Multiple List As Argument
    @{NUMBERS} =    Create List    ${1}    ${2}    ${5}
    @{NAMES} =    Create List    one     two     five
    FOR-IN-ZIP     ${NUMBERS}    ${NAMES}