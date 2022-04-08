***Settings***
Library         RequestsLibrary
Library         Collections

***Variables***
${base_url}     https://gorest.co.in
         
***Test Cases***
Get_users
    create session    url    ${base_url}
    ${response}=      Get On Session     url     /public/v2/posts

    log to console    ${response.status_code}
    log to console    ${response.content}
    log to console    ${response.headers}

    #Validations 

    ${status_code}=   convert to string     ${response.status_code}
    should be equal   ${status_code}        200

    ${body}=          convert to string     ${response.content}
    should contain    ${body}               Arx brevis sed tempore molestiae decimus.

