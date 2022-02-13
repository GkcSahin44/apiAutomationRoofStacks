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