Feature: Delete User

  Background:
    * url baseURL
    * def headers = configHeaders
    * def getUserResponse = read(roofStackData + 'getAllUserResponse.json')
    * def getUserResponseModel = read(roofStackData + 'getAllUserResponseModel.json')
    * def firstId = getUserResponse[0].id
    * def secondId = getUserResponse[1].id

  @positive
  Scenario: delete user by first id
    Given path firstId
    When method DELETE
    Then status 200
    And match response == '#notnull'
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario: delete user by second id
    Given path secondId
    When method DELETE
    Then status 200
    And match response == '#notnull'
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario Outline: delete user by id with examples tables
    Given path '<userId>'
    When method DELETE
    Then status 200
    And match response == '#notnull'
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |
      | c3e140a4-99db-44c2-a9ea-896904745993 |