package performanceRunners

import io.gatling.core.Predef._
import com.intuit.karate.gatling.PreDef._
import scala.concurrent.duration._


class APISimulationBFF extends Simulation {
  val protocol = {
    karateProtocol()
  }
  val csvFeed = csv("dbstest.csv").circular
  val userCount = System.getProperty("userCount")
  val duration = System.getProperty("duration")
  val constantUser = System.getProperty("constantUser")
  val constantDuration = System.getProperty("constantDuration")



  val create = scenario("create").feed(csvFeed).exec(karateFeature("classpath:bff/features/content/contentCategoryUrlSlug.feature@name=load"))
  setUp(
      create.inject(rampUsers(userCount.toInt) during Duration(duration.toInt, SECONDS),
      constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt, SECONDS)).protocols(protocol)
  )

}