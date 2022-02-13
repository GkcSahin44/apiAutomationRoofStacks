Feature: Get User

  Background:
    * url baseURL
    * def headers = configHeaders
    * def getUserResponse = read(roofStackData + 'getAllUserResponse.json')
    * def getUserResponseModel = read(roofStackData + 'getAllUserResponseModel.json')
    * def firstId = getUserResponse[0].id
    * def secondId = getUserResponse[1].id

  @positive
  Scenario: get all user
    Given method GET
    Then status 200
    And match response == getUserResponse
    And match response == getUserResponseModel
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario: get user by defined first id
    Given path firstId
    When method GET
    Then status 200
    And match response.id == firstId
    And match response.isActive == '#boolean'
    * print 'Response body were checked. Response Id is : ' + response.id, 'Defined ID : ' + firstId

  @positive
  Scenario: get user by defined second id
    Given path secondId
    When method GET
    Then status 200
    And match response == getUserResponse
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario Outline: get user by id with examples tables
    Given path '<userId>'
    When method GET
    Then status 200
    And  match each  response[*].id == '#string'
    And  match each  response[*].username == '#string'
    And  match each  response[*].firstName == '#string'
    * karate.log('Response body were checked. Response is : ',response)

    Examples:
      | userId                               |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 |
      | c3e140a4-99db-44c2-a9ea-896904745993 |

