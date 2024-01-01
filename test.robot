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



*** Keywords ***
create list without duplicates
    [Documentation]    ${simple list}    ${one more simple list}
        ${new simple list}=   Remove Duplicates   ${simple list}
        ${new list}=  Combine Lists    ${new simple list}    ${one more simple list}
        Log To Console   ${\n}${new list} this is our new list
        ${len}=   Get Length    ${new list}
        Log To Console    ${\n}'${len}' and this is its length

