*** Keywords ***

Go to Regulatory Tracking component
    Click Element  ${RT_RegTrack}
    Verify page context  ${RT_verify_title}

User Creates Track Submission
    [Arguments]  ${track_submission}
    Click Element  ${RT_track_submsn}
    Click Element  ${track_submission}
    sleep  2s
    Click Element  ${RT_select_reg_body}
    Select the expected Regulatory Body  ${RT_regulatory_body}
    Click Element  ${RT_submsn_planned_date}
    Input Text  ${RT_submsn_planned_date}  ${RT_subm_planned}
    sleep  2s
    Click Element  ${RT_outcome_planned_date}
    Input Text  ${RT_outcome_planned_date}  ${RT_outcome_planned}
    sleep  2s
    ${protocol} =  Generate Random Numberic value
    Click Element  ${RT_Protocol_Version}
    Input Text  ${RT_Protocol_Version}  ${protocol}
    Click Element  ${Save}
    sleep  5s

Select the expected Regulatory Body
    [Arguments]  ${reg_body}
    ${select_reg_body} =  Set Variable  xpath=//div[starts-with(text(), '${reg_body}')]
    Click Element  ${select_reg_body}

Verify Regulatory Tracking creation
    ${success_text} =  Get Text  ${RT_Success_msg}
    Should Be True	'${success_text}' == '${RT_Expected_Success_msg}'
    sleep  2s
    Input Text  ${RT_submission_search}  ${RT_regulatory_body}
    Click Element  ${Click_Search}
    sleep  2s
    Verify page context  ${RT_regulatory_body}
    Capture Page Screenshot  TC_01.png