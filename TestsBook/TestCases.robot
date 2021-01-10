*** Settings ***
Library      SeleniumLibrary
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot


#robot -d results Tests/TestCases.robot  


*** Test Cases ***
Online Indain book store
    [Tags]    sanity
    Open India Bookstore
    Navigate to Category "Crime, Thriller & Mystery"
    Click on "Thriller" Sub Section
    Search for the book title 'The sunlit night' in the Booklist
    Go to Expected Book details page
    Verify User navigated to the expected book details
    User should be able to Land on Book details Page 
    Title verification 
    Adding the book to the cart
   