# Traffic Lights
A quick tool you can display on the screens near your desks to allow members of the team to indicate how busy they are.

## Getting it running
**For development:**
- Create a database of your choice locally
- Add a table "trafficlightstatus"
- Add the columns (id, user, trafficlight, message, workingfromhome, lastupdated)
- Add the Spring DataSource config to a local `application.properties` file in `src/main/resources`
- Run the TrafficLightsApplication

**Building the docker image:**
- Run the Gradle docker task
- `docker run` the image