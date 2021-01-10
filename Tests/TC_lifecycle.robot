*** Settings ***
Resource  ../Application/Common.robot
Resource  ../LocatorVariables.robot

#Initializing Tests
Suite Setup  Begin Web Test
Suite Teardown  Close Web Test
Test Setup  Login Medidata
Test Teardown  LogOut Medidata

#robot -d Results Tests/TC_lifecycle.robot
#robot -d Results -i r11  Tests
*** Test Cases ***

User should be able to create a submission at the site level
    [Tags]    e2e
    Given User has access to CDS  ${RT_CDS}
    When User navigates to Study where assigned with Regulatory Tracking BB  ${RT_Study}
    Then User lands on Site which has Site Regulatory Tracking  ${RT_Site}
    And User Creates Track Submission  ${RT_local_submsn}
    And Verify Regulatory Tracking creation

Links from TM Lifecycle Widget navigate to the correct page in TM Application
    [Tags]    e2e
    Given User has access to CDS  ${TM_CDS}
    When User navigates to Study where assigned with Lifecycle BB  ${TM_Study}
    Then User lands on Site which has Tasks Widget  ${due_upcoming}
    And User should be navigated to Task Management Application  ${task_title}
    And Validate the Task widget lands on correct page in TM Application  ${study_tasks}

Links from Site Lifecycle Widget navigate to the correct page in Site Monitoring Application
    [Tags]    r07_SM
    Given User has access to CDS  ${SM_CDS}
    When User navigates to Study where assigned with Lifecycle BB  ${SM_Study}
    Then User lands on Site which has Site Initiation Visit  ${SM_Site}
    And User should be navigated to Site Monitoring Application  ${visit_title}