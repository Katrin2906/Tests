*** Settings ***
Library    String
Library    Collections
Library    BuiltIn
Library    OperatingSystem

*** Variables ***
${string}    Опя ть считаем строки
@{list}

*** Test Cases ***
string counting
     @{list}    Convert To List    ${string}
      #Log To Console    ${\n}@{list}
     FOR    ${index}   ${value}    IN ENUMERATE    @{list}
         IF    "${value}"=="${SPACE}"
             Log To Console     ${\n}${index} символ - пробел
             Continue For Loop
             END
         Log To Console     ${\n}${index} символ - ${value}
         END

*** Keywords ***