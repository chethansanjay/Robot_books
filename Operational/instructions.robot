*** Settings ***
Library  SeleniumLibrary
Library  Collections
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot


*** Keywords ***
Open India Bookstore
    Open Browser  ${website_URL}  ${browser}   
    Maximize Browser Window
    sleep  4s
    Verify WebPage title  ${Expected_homePage_ttl}
    Execute Javascript  window.scrollTo(0, 500)
    Log to Console  success!!


Navigate to Category "Crime, Thriller & Mystery"
    ${nav_count} =  Get Element Count  xpath=//*[@id="leftNavContainer"]/ul/li
    sleep  3s
    FOR  ${i}  IN RANGE  1  ${nav_count}
        ${dynamic_name} =  Get Text  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Exit For Loop If  "${dynamic_name}" == "${Expected_name}"
    END
    Set Test Variable  ${static_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Navigation success
   


Click on "Thriller" Sub Section
    Mouse Over  ${static_name}
    sleep  1s
    Mouse Over  ${Digital_Media}
    sleep  3s
    Verify WebPage title  Thriller 
    Click Element  ${Digital_Media}
    sleep  1s
    Verify WebPage title  ${Expected_Book_Category}
    Log to Console  Sub selection success!!
   


Search for the book title 'The sunlit night' in the Booklist
    ${No_of_books} =  Get Element Count  xpath=//div[@class='col-md-9']/div
    FOR  ${j}  IN RANGE  2  ${No_of_books}
    ${books_name} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Exit For Loop If  "${books_name}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${particular_ele}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Log to Console  Booklist successfull!!

Go to Expected Book details page
    sleep  5s
    Click Element  ${particular_ele}
    Log to Console  Details successfull!!
    
Verify User navigated to the expected book details
    Verify WebPage title  ${Book_Name}
    Log to Console  Successfully navigated!!

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  ${title_name} 
    Log to Console  Verfied Successfully!!


User should be able to Land on Book details Page 
    sleep  3s
    Click Link    xpath=//a[text()='Rs.299 @Amazon']
    select window   title=Buy The Sunlit Night Book Online at Low Prices in India | The Sunlit Night Reviews & Ratings - Amazon.in
    sleep  3s

Title verification 
    Verify WebPage title  ${Expected_routedpagettl}
    Log to Console  ${Expected_routedpagettl}
    Log to Console  Title verified!!

Adding the book to the cart
    wait until page contains element  //input[@name="submit.add-to-cart"]
    sleep  5s
    Click Element   //input[@name="submit.add-to-cart"]
    Log to Console  Added to cart!!
    sleep  2s
    Click Element  //a[@id='hlb-view-cart-announce']
    ${response}    Get Text    //span[contains(text(),'The Sunlit Night')]
    Should Be Equal As Strings    ${response}    The Sunlit Night
    Capture Page Screenshot
    Log to Console  Added to cart Successfully!!
    sleep  5s
    close browser
    




     
    
    
    