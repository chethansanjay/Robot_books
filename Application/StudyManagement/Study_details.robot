*** Keywords ***

Go to Listing Page and Search for the assigned Study
    [Arguments]    ${Study_Name}
    #Click Element  ${Overview_page} 
    Log to Console  Step 4 Success
    sleep  3s
    Input Text  ${study_search}  ${Study_Name}
    sleep  3s
    Click Element  ${Click_Search}
    sleep  5s
    ${select_study} =  Set Variable  xpath=//span[starts-with(text(), '${Study_Name}')]
    Click Element  ${select_study}
    Verify page context  ${Study_Name}

Go to Listing Page and Search for the assigned Site
    [Arguments]    ${Site_Name}
    #Click Element  ${Overview_page} 
    sleep  3s
    Input Text  ${site_search}  ${Site_Name}
    sleep  3s
    Click Element  ${Click_Search}
    sleep  5s
    ${select_site} =  Set Variable  xpath=//span[starts-with(text(), '${Site_Name}')]
    Click Element  ${select_site}
    Verify page context  ${Site_Name}

Go to Study Settings and Milestones Template
    Log to Console  Step 5 Success
    sleep  4s
    Verify page element  ${Study_Settings}
    Click Element  ${Study_Settings}
    sleep  3s
    Click Element  ${Study_Settings_milestone_template}
    sleep  3s
    Verify page context  ${Template_Name}
    sleep  3s
    Verify page context  ${alias_name}

Go to Site Listing page
    sleep  3s
    Click Element  ${site_listing}

Verify if Site Initiation Visit Conducted
    Verify page context  ${SM_conducted}

Go to Site Monitoring Application
    Click Element  ${SM_site_visit}

Click on Task Widget
    sleep  3s
    Click Element  ${TM_SE_Task_Mngmt}

Verify Task Widget has actual tasks
    Verify page context  ${TM_SE_task_popup}
    sleep  3s

Click on task widget link
    [Arguments]    ${task_link}
    Click Element  ${task_link}