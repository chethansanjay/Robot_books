*** Keywords ***

Click on the CDS name under Study management application left menu
    [Arguments]    ${CDS_Name}
    ${appList} =  Get Element Count  xpath=//*[@class='sidebar-content']/div
    Log to console  ${appList}
    FOR  ${i}  IN RANGE  1  ${appList}+2
        ${app_text} =  Get Text  xpath=//*[@class='sidebar-content']/div[${i}]/div[1]/span[1]
        Log to console  ${app_text}
        Exit for loop if  "${app_text}" == "STUDY MANAGEMENT"
    END
    Set Test Variable  ${Exact_App}  xpath=//*[@class='sidebar-content']/div[${i}]/div[1]/span[1]

    ${cdsList} =  Get Element Count  xpath=//*[@class='sidebar-content']/div[${i}]/div
    Log to console  ${cdsList}

    FOR  ${j}  IN RANGE  2  ${cdsList}+2
        ${cds_text} =  Get Text  xpath=//*[@class='sidebar-content']/div[${i}]/div[${j}]/a
        Log to console  ${cds_text}
        Exit for loop if  "${cds_text}" == "${CDS_Name}"
    END

    Set Test Variable  ${Exact_CDS}  xpath=//*[@class='sidebar-content']/div[${i}]/div[${j}]/a
    Click Element  ${Exact_CDS}
    Verify page context  ${Studies}

Click on the CDS name under Study management application left menu old
    [Arguments]    ${CDS_Name}
    Verify page context  ${Expected_MainPage_Content}
    ${cdsList} =  Get Element Count  xpath=//*[@class='sidebar-container']/div/div[1]/div
    #Log to console  ${cdsList}

    FOR  ${i}  IN RANGE  2  ${cdsList}-2
        ${cds_text} =  Get Text  xpath=//*[@class='sidebar-container']/div/div[1]/div[${i}]/a
        #Log to console  ${cds_text}
        Exit for loop if  "${cds_text}" == "${CDS_Name}"
    END

    Set Test Variable  ${Exact_CDS}  xpath=//*[@class='sidebar-container']/div/div[1]/div[${i}]/a
    Click Element  ${Exact_CDS}
    Verify page context  ${Studies}

Click on Settings from left menu and Go to Milestones Templates section
    sleep  5s
    Click Element  ${Settings}
    sleep  2s
    Click Element  ${Milestone_Template_Section}
    Verify page context  ${Verify_Template_page}

Create Template by Clicking on Add Template
    Log to Console  Step 1 Success
    Create configurable milestone name
    sleep  5s
    Click Element  ${Add_Template}
    sleep  2s
    Input Text  ${Enter_Template}  ${Template_Name}
    sleep  2s
    Click Element  ${Save_Template}
    sleep  2s
    Verify page context  ${Template_Name}

Click on Add milestone and Provide unique "Alias" and "Reporting Name"
    Log to Console  Step 2 Success
    sleep  2s
    Click Element  ${Add_Milestone}
    sleep  2s
    Input Text  ${Alias_Element}  ${alias_Name}  
    sleep  2s
    Input Text  ${Reporting_Element}  ${Report_Name}  
    sleep  2s
    Click Element  ${Context_Click}  
    sleep  2s
    Wait Until Element Is Visible  ${Context_dd}  timeout=15
    sleep  2s
    Click Element  ${Select_Study}  
    sleep  2s
    Click Element  ${Save_Milestone}  
    sleep  2s
    Verify page context  ${alias_Name}  
    sleep  5s

Click on Assign to Study Link, Assign to an available Study and Save
    Log to Console  Step 3 Success
    Click Element  ${Assign_Template}
    sleep  2s
    Click Element  ${Click_Search_Template}
    sleep  2s
    Input Text  ${Click_Assign_Study}  ${Study_Name}
    sleep  2s
    Wait Until Element Is Visible  ${Assign_dd}  timeout=15
    sleep  6s
    
    #${list_count} =  xpath=//div[@class="assign_template_to_se"]/div/div/div[2]/div/div
    #Wait Until Element Is Visible  ${list_count}
    ${list_count_int} =  Get Element Count  xpath=//div[@class="assign_template_to_se"]/div/div/div[2]/div/div
    #Log to console  ${list_count_int}
    FOR  ${m}  IN RANGE  1  ${list_count_int}
    ${list_name} =  Get Text  xpath=//div[@class="assign_template_to_se"]/div/div/div[2]/div/div[${m}]/span
    #Log to console  ${list_name}
    Exit for loop if  "${list_name}" == "${Study_Name} (PROD)"
    END
    Set Test Variable  ${Exact_Study_Assign}  xpath=//div[@class="assign_template_to_se"]/div/div/div[2]/div/div[${m}]/span
    Click Element  ${Exact_Study_Assign}
    #Click Element  ${Assign_UAT}
    sleep  2s
    Click Element  ${Study_Assigned}
    sleep  2s
    Click Element  ${Overview_page} 