Feature: Create User

  Background:
    * url baseURL
    * def createUserRequest = read(roofStackData + 'createUserRequest.json')
    * def createUserResponse = read(roofStackData + 'createUserResponse.json')

  @positive
  Scenario: create user
    Given request createUserRequest
    When method post
    Then status 200
    And match response == createUserResponse
    * karate.log('Response body were checked. Response is : ',response)