package performanceRunners

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._


class APISimulationBFFParam extends Simulation{
  val protocol = {
    karateProtocol()
  }
  val csvFeed = csv("dbstest.csv").circular
  val featurePath = System.getProperty("featureName")
  val userCount = System.getProperty("userCount")
  val duration = System.getProperty("duration")
  val constantUser = System.getProperty("constantUser")
  val constantDuration = System.getProperty("constantDuration")
  protocol.nameResolver = (req, ctx) => req.getUrlAndPath()

  val create = scenario("create").feed(csvFeed).exec(karateFeature("classpath:bff/features/" + featurePath))
  setUp(
    create.inject(rampUsers(userCount.toInt) during  Duration(duration.toInt, SECONDS),
      constantUsersPerSec(constantUser.toInt) during Duration(constantDuration.toInt,SECONDS)).protocols(protocol)
  )
}