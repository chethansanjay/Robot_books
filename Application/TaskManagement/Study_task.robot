*** Keywords ***
Observe the Task Management Title
    [Arguments]  ${task_filter}
    Log to Console  ${task_filter}
    Verify page context  ${task_filter}
    Capture Page Screenshot  TC_02.png
    Go to Home page