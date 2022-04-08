***Settings***
Library                 RequestsLibrary
Library                 Collections
Library                 OperatingSystem

***Variables***
${base_url}             http://gorest.co.in
${bearerToken}          "Bearer c969a4ac8ca381040575278fe9f63bde1efb7f30ad9f92b7b42abfbdd395fd49"
         
***Test Cases***
POST_Home
    Create Session      mysession              ${base_url}     

    ${headers}=         Create Dictionary      Authorization=${bearerToken}     Content-Type=application/json
    
    ${body}=            Create Dictionary      id=1308 name=aa email=teste@gail.com gender=female status=active
    ${response}=        POST On Session        mysession   /public/v2/posts    data=${body}    headers=${headers}
    

    Log to console      ${response.status_code}
    Log to console      ${response.content}
    

    #Validations

    ${status_code}=     convert to string    ${response.status_code}
    should be equal     ${status_code}       200 
    


