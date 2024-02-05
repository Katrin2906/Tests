# 1-зайти на онлайнер
# 2-перейти в каталог телефонов
# 3-отсортировать по двум любым производителям
# 4-собрать в словарь данные вида: модель=стоимость(только цифры)
# 5-залогировать получившиеся словари

*** Settings ***
Library    BuiltIn
Library    OperatingSystem
Library    Collections
Library    String
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.onliner.by/
${browser}    chrome

*** Test Cases ***
finding fones
    Open Browser    ${url}    ${browser}     options=add_experimental_option("detach", True)
    Maximize Browser Window
    Page Should Contain Element    //span[text()="Смартфоны"]
    Click Element    //span[text()="Смартфоны"]
    Page Should Contain Element     //*[contains(@class, "catalog-form__line")]//ul[1]
    Execute Javascript    document.evaluate("//*[contains(@class, "catalog-form__line")]//ul[1]/li[1]//input",document.body,null,9,null).singleNodeValue.click()
    # or xpath //div[.='POCO']/ancestor::label//input[1]
    ${counter}    Get Element Count    //*[contains(@class, "form__offers-part_data")]/div[1]/a
    FOR    ${i}    IN RANGE   1     ${counter}
        #Scroll Element Into View    ${Element-path-From}
        #Wait Until Element is visible    ${Element-Path-To}
        Scroll Element Into View    (//*[contains(@class, "form__offers-part_data")]/div[1]/a)[${i}]
        ${key_model}    Get Text    (//*[contains(@class, "form__offers-part_data")]/div[1]/a)[${i}]
        ${value_price}    Get Text    (//*[contains(@class, "form__offers-part_control")]//div/a/span[2])[${i}]
        ${value_price_clean}    Remove String Using Regexp    ${value_price}    [а-яА-Я]\.
        ${dict}    Set To Dictionary    ${dict}    ${key_model}=${value_price_clean}
    END
