Feature: All Methods Together

  Background:
    * url baseURL
    * def createUserRequest = read(roofStackData + 'createUserRequest.json')
    * def createUserResponse = read(roofStackData + 'UserResponse.json')
    * def patchUserActivityModel = read(roofStackData + 'patchUserActivityModel.json')
    * def patchUserActivityRequest = read(roofStackData + 'patchUserRequest.json')
    * def putUserInformationModel = read(roofStackData + 'UserResponse.json')
    * def putUserInformationRequest = read(roofStackData + 'putUserInformationRequest.json')
    * def activityPath = configActivityPath
    * def headers = configHeaders

  @positive
  Scenario: All Methods Together
    Given request createUserRequest
    When method POST
    Then status 200
    And match response == createUserResponse
    * def userId = response.userId
    * print "userId :" + userId

    Given path userId
    When method GET
    Then status 200
    And match response.id == userId
    And match response.isActive == '#boolean'
    * print 'Response body were checked. Response Id is : ' + response.id

    Given path userId , activityPath
    And request patchUserActivityRequest
    When method PATCH
    Then status 200
    And match response == patchUserActivityModel
    And match response.userId == userId
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

    Given path userId
    And request putUserInformationRequest
    When method PUT
    Then status 200
    And match response == putUserInformationModel
    And match response.userId == userId
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)

    Given path userId
    When method DELETE
    Then status 200
    And match response == '#notnull'
    And match responseHeaders['Content-Type'][0] == headers
    * karate.log('Response body were checked. Response is : ',response)



