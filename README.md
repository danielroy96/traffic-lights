# Traffic Lights
A quick tool you can display on the screens near your desks to allow members of the team to indicate how busy they are.

## Getting it running
**For development:**
- Create a database of your choice locally
- Add the Spring DataSource config to a local `application.properties` file in `src/main/resources`
- Run the TrafficLightsApplication (Flyway should sort out the rest)

**Building the docker image:**
- Run the Gradle docker task
- `docker run` the image
