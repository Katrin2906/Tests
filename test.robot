*** Settings ***
Library    String
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Library    SeleniumLibrary
*** Variables ***
@{simple list}    1    1    2    3
@{one more simple list}    2    4    6
@{new list}
${len}
*** Test Cases ***
test with lists
   # List Should Not Contain Duplicates    ${simple list}     msg='we have a trouble'
    create list without duplicates
tests with string
     Set Test Variable     ${my little string}     New simple String123
     Log To Console       ${\n}${my little string}
     ${new result}  Convert To Lower Case    ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}  Convert To Upper Case   ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}  Convert To Title Case    ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}  Fetch From Left       ${my little string}    l
     Log To Console    ${\n}${new result}
     ${new result}    Fetch From Right         ${my little string}    l
     Log To Console    ${\n}${new result}
     ${new result}    Encode String To Bytes      ${my little string}  UTF-8
     Log To Console    ${\n}${new result}
     ${new result}    Format String        ${my little string}        {:*^30}
     Log To Console    ${\n}${new result}
     ${new result}    Generate Random String      8    rydjBBiYY1
     Log To Console    ${\n}${new result}
     ${new result}    Get Line    ${my little string}     -1
     Log To Console    ${\n}${new result}
     ${new result}    Get Line Count        ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}    Get Lines Containing String       ${my little string}   si
     Log To Console    ${\n}${new result}
     ${new result}    Get Lines Matching Pattern        ${my little string}   si
     Log To Console    ${\n}${new result}
     ${new result}    Get Lines Matching Regexp           ${my little string}   si
     Log To Console    ${\n}${new result}
     ${new result}    Get Regexp Matches              ${my little string}  si
     Log To Console    ${\n}${new result}
     ${new result}    Get Substring         ${my little string}    2   8
     Log To Console    ${\n}${new result}
     ${new result}    Remove String             ${my little string}   simple
     Log To Console    ${\n}${new result}
     ${new result}    Remove String Using Regexp              ${my little string}    s    IGNORECASE
     Log To Console    ${\n}${new result}
     ${new result}    Replace String        ${my little string}    i    R
     Log To Console    ${\n}${new result}
     ${new result}    Should Be String          ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}    Split String From Right    ${my little string}  r
     Log To Console    ${\n}${new result}
     ${new result}    Split String To Characters        ${my little string}
     Log To Console    ${\n}${new result}
     ${new result}    Strip String           ${my little string}
     Log To Console    ${\n}${new result}



*** Keywords ***
create list without duplicates
    [Documentation]    ${simple list}    ${one more simple list}
        ${new simple list}=   Remove Duplicates   ${simple list}
        ${new list}=  Combine Lists    ${new simple list}    ${one more simple list}
        Log To Console   ${\n}${new list} this is our new list
        ${len}=   Get Length    ${new list}
        Log To Console    ${\n}'${len}' and this is its length

