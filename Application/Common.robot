*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  String
Resource  ../Application/Utility_bridge.robot
Resource  ../Application/Pages/CDS_home.robot
Resource  ../Application/StudyManagement/Study_details.robot
Resource  ../Application/StudyManagement/Site_details.robot
Resource  ../Application/StudyManagement/Milestones.robot
Resource  ../Application/StudyManagement/Regulatory_Tracking.robot
Resource  ../Application/TaskManagement/Study_task.robot

*** Keywords ***

Begin Web Test
    Open Browser  about:blank  ${brows_medidata}
    sleep  3s
    Maximize Browser Window
    Set Screenshot Directory  ${ScreenhotFilePath}

Login Medidata
    Go To  ${medidata_url}
    sleep  4s
    Input Text  ${M_username_element}  ${M_username}
    sleep  1s
    Input Text  ${M_passwrdd_element}  ${M_passwrdd}
    sleep  1s
    Click Button  ${M_Login}
    sleep  3s

LogOut Medidata
    Click Element  ${M_HomeImage}
    sleep  3s
    Click Element  ${M_UserSettingsLink}
    Click Element  ${M_Logout}
    sleep  3s
    
Close Web Test
    Close Browser

Generate Random Numberic value
    ${protocol_val} =  Generate Random String  15  [NUMBERS]
    Log to Console  ${protocol_val}
    [Return]  ${protocol_val}

#Common Utilities
Verify page context
    [Arguments]  ${Expected_Page_contains}
    sleep  3s
    Wait Until Page Contains  ${Expected_Page_contains}  timeout=20
    Log  ${Expected_Page_contains}
    Log  Pass!!
    sleep  3s

Verify page element
    [Arguments]  ${Expected_Page_element}
    Wait Until Page Contains Element  ${Expected_Page_element}  timeout=20
    Log  ${Expected_Page_element}
    Log  Element Found-Pass!!

Create configurable milestone name
    ${DateTimeWithNoSpace} =  Get Date time as a string with no space
    ${Template_Name} =  Catenate  SEPARATOR=_  ${Template_Name_prefix}  ${DateTimeWithNoSpace}
    ${Template_Name} =  Set Test Variable  ${Template_Name}
    ${alias_name} =  Catenate  SEPARATOR=_  ${alias_Name_prefix}  ${DateTimeWithNoSpace}
    ${alias_name} =  Set Test Variable  ${alias_name}
    ${Report_Name} =  Catenate  SEPARATOR=_  ${Report_Name_prefix}  ${DateTimeWithNoSpace}
    ${Report_Name} =  Set Test Variable  ${Report_Name}

Get Date time as a string with no space
    ${DateTime} =  Get Current Date
    ${DateTimeWithNoSpace} =  Convert Date  ${DateTime}  result_format=%d%m%Y%H%S
    [Return]  ${DateTimeWithNoSpace}

Verify Page Title
    [Arguments]  ${page_title}
    sleep  3s
    Title Should Be  ${page_title}
    sleep  3s

Go to Home page
    Click Element  ${home}