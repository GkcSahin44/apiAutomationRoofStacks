Feature: Partial Update User Activity

  Background:
    * url baseURL
    * def getUserResponse = read(roofStackData + 'getAllUserResponse.json')
    * def patchUserActivityModel = read(roofStackData + 'patchUserActivityModel.json')
    * def patchUserActivityRequest = read(roofStackData + 'patchUserRequest.json')
    * def firstId = getUserResponse[0].id
    * def secondId = getUserResponse[1].id
    * def activityPath = 'activity'

  @positive
  Scenario: update user activity by first id  (isActive : True)
    Given path firstId , activityPath
    And request patchUserActivityRequest
    When method PATCH
    Then status 200
    And match response == patchUserActivityModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario: update user activity by second id (isActive : False)
    Given path secondId , activityPath
    * set patchUserActivityRequest.isActive = 'false'
    And request patchUserActivityRequest
    When method PATCH
    Then status 200
    And match response == patchUserActivityModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    * karate.log('Response body were checked. Response is : ',response)

  @positive
  Scenario Outline: update user activity with examples tables
    Given path secondId , activityPath
    * set patchUserActivityRequest.isActive = <isActive>
    And request patchUserActivityRequest
    When method PATCH
    Then status 200
    And match response == patchUserActivityModel
    And match response.userId == firstId
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    * karate.log('Response body were checked. Response is : ',response)

    Examples:
      | isActive |
      | true     |
      | false    |

