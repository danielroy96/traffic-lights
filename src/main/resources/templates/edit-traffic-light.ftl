<#import "spring.ftl" as spring />
<#import "light.ftl" as light>
<@spring.bind "trafficLight" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Traffic Light</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="traffic-light-container" id="trafficLights" v-bind:class="[darkMode ? 'body-dark':'']">
  <div class="container">
    <h2 class="mt-3 mb-3 text-center"><#if (trafficLight.id > 0)>Update<#else>Create</#if> traffic light</h2>
  </div>
  <div class="container">
    <form>
      <div class="form-group">
        <label for="user">Name</label>
        <input id="user" name="user" class="form-control" type="text" value="${trafficLight.user}"
               v-bind:class="[darkMode ? 'input-dark':'']">
        <small>Your name as it will appear on your traffic light</small>
      </div>
      <div class="form-group">
        <label for="trafficLight">Traffic Light</label>
        <select id="trafficLight" name="trafficLight" class="form-control" v-bind:class="[darkMode ? 'input-dark':'']">
          <option value="GREEN" <#if trafficLight.trafficLight == "GREEN">selected</#if>>Green</option>
          <option value="AMBER" <#if trafficLight.trafficLight == "AMBER">selected</#if>>Amber</option>
          <option value="RED" <#if trafficLight.trafficLight == "RED">selected</#if>>Red</option>
          <option value="OFF" <#if trafficLight.trafficLight == "OFF">selected</#if>>Off (I'm away)</option>
        </select>
        <small>Your available capacity</small>
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <input id="message" name="message" class="form-control" type="text"
               value="<#if trafficLight.message??>${trafficLight.message}</#if>"
               v-bind:class="[darkMode ? 'input-dark':'']">
        <small>Leave more information for the rest of the team</small>
      </div>
      <div class="form-group">
        <label>Remote Working</label>
        <div class="form-check">
          <input id="workingFromHome" name="workingFromHome" class="form-check-input" type="checkbox"
                 <#if trafficLight.workingFromHome>checked</#if> v-bind:class="[darkMode ? 'input-dark':'']">
          <label for="workingFromHome" class="form-check-label">I'm working from home</label>
        </div>
      </div>
      <div class="form-group">
        <#if (trafficLight.id > 0)>
          <button type="submit" class="btn btn-primary" formaction="/${trafficLight.id}/edit" formmethod="post">Save
          </button>
          <button type="submit" class="btn btn-danger btn-delete float-right" formaction="/${trafficLight.id}/delete"
                  formmethod="post">Delete
          </button>
        <#else>
          <button type="submit" class="btn btn-primary" formaction="/create" formmethod="post">Create</button>
        </#if>
        <button type="submit" class="btn btn-light" formaction="/" formmethod="get">Cancel</button>
      </div>
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
    var app = new Vue({
        el: '#trafficLights',
        data: {
            darkMode: false,
            cookies: Cookies,
        },
        mounted() {
            this.darkMode = Cookies.get('darkMode') === "true";
        },
    })
</script>
</body>
</html>