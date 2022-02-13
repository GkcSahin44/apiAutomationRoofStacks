Feature: Create User

  Background:
    * url baseURL
    * def createUserRequest = read(roofStackData + 'createUserRequest.json')
    * def createUserResponse = read(roofStackData + 'UserResponse.json')

  @positive
  Scenario: create user
    Given request createUserRequest
    When method POST
    Then status 200
    And match response == createUserResponse
    * print 'Response body were checked. Response is : ' + response, 'Response User ID : ' + response.userId

  @negative
  Scenario Outline: create user with examples tables
    * set createUserRequest.firstName = <firstName>
    * set createUserRequest.lastName = <lastName>
    * set createUserRequest.username = <username>
    Given request createUserRequest
    When method POST
    And match responseStatus == <responseStatus>
    * karate.log ('Response Statülerin Table üzerinden Kontrol edilebileceği gösterilmiştir')
    * karate.log ('Olası statüler gösterilmeye çalışılmıştır.')

    Examples:
      | firstName                                                      | lastName                                                       | username                                                       | responseStatus |
      | ''                                                             | ''                                                             | 1                                                              | 400            |
      | '/*/*//*/*/*?'                                                 | '/*/*/**'                                                      | '***/*/*'                                                      | 400            |
      | ''                                                             | '7'                                                            | 1                                                              | 400            |
      | '7'                                                            | ''                                                             | 1                                                              | 400            |
      | ''                                                             | '*'                                                            | 1                                                              | 400            |
      | '/'                                                            | '*'                                                            | 1                                                              | 404            |
      | ' '                                                            | ' '                                                            | '   '                                                          | 404            |
      | 'gokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokce' | 'gokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokce' | '*1984'                                                        | 404            |
      | 'gokce'                                                        | 'sahin'                                                        | 'gokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokcegokce' | 404            |
      | 'WHERE 1=1 OR 1=1'                                             | ' 1=1 OR 1=1'                                                  | 'gokce'                                                        | 404            |