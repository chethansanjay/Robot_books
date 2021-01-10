*** Keywords ***
Go to Milestones Page and Observe the Configurable Milestone
    Log to Console  Step 6 Success
    sleep  3s
    Verify page element  ${MIL_page}
    Click Element  ${MIL_page}
    Verify page context  ${Milestone}
    Verify page context  ${alias_name}
    Capture Page Screenshot  TC_04.png