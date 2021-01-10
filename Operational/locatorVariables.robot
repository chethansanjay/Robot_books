*** Variables ***

${website_URL} =  https://www.indiabookstore.net/ 
${browser} =  gc
${Expected_homePage_ttl} =  Buy books online in India from online bookstores
${Expected_name} =  Crime, Thriller & Mystery
${Expected_Book_Name} =  The Sunlit Night
${Expected_Book_Category} =  Thriller 
${Digital_Media} =  xpath=//*[@id="leftNavContainer"]/ul/li[8]/ul/li[2]
${Digital_Media} =  xpath=//[text()='Crime, Thriller & Mystery']//following::li[2]
${Book_Name} =  The Sunlit Night by Rebecca Dinerstein - Compare price for The Sunlit Night
${Expected_routedpagettl} =  Buy The Sunlit Night Book Online at Low Prices in India | The Sunlit Night Reviews & Ratings - Amazon.in