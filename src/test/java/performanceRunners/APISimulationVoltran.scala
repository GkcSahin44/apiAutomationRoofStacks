package performanceRunners

import io.gatling.core.Predef._
import com.intuit.karate.gatling.PreDef._
import scala.concurrent.duration._


class APISimulationVoltran extends Simulation{
  val protocol = {
    karateProtocol()
  }
  val csvFeed = csv("dbstest.csv").circular
  val userCount = System.getProperty("userCount")
  val duration = System.getProperty("duration")
  val constantUser = System.getProperty("constantUser")
  val constantDuration = System.getProperty("constantDuration")

  val getCdn = scenario("getCdn").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/getCdn.feature@name=load"))
  val getDetail = scenario("getDetail").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/getDetail.feature@name=load"))
  val getRating = scenario("getRating").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/getRating.feature@name=load"))
  val getSeries = scenario("getSeries").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/getSeries.feature@name=load"))
  val getSports = scenario("getSports").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/getSports.feature@name=load"))
  val quickSearch = scenario("quickSearch").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/quickSearch.feature@name=load"))
  val search = scenario("search").feed(csvFeed).exec(karateFeature("classpath:voltran/features/content/search.feature@name=load"))

  setUp(
    getCdn.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    getDetail.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    getRating.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    getSeries.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    getSports.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    quickSearch.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol),
    search.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
    constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol)
    )

}