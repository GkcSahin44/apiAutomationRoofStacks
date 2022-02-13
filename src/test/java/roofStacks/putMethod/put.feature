Feature: Update User Information

  Background:
    * url baseURL
    * def headers = configHeaders
    * def getUserResponse = read(roofStackData + 'getAllUserResponse.json')
    * def putUserInformationModel = read(roofStackData + 'UserResponse.json')
    * def putUserInformationRequest = read(roofStackData + 'putUserInformationRequest.json')
    * def firstId = getUserResponse[0].id
    * def secondId = getUserResponse[1].id

  @positive
  Scenario: update user information by first id
    Given path firstId
    And request putUserInformationRequest
    When method PUT
    Then status 200
    And match response == putUserInformationModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario: update user information by second id
    Given path secondId
    And request putUserInformationRequest
    When method PUT
    Then status 200
    And match response == putUserInformationModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario Outline: update user information with examples tables

    Given path '<userId>'
    * set putUserInformationRequest.lastName = '<lastName>'
    And request putUserInformationRequest
    When method PUT
    Then status 200
    And match response == putUserInformationModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

    Examples:
      | userId                               | lastName |
      | c4f6c088-f91b-494e-b7f0-a08f48df3180 | Gokce    |
      | c3e140a4-99db-44c2-a9ea-896904745993 | Sahın    |


