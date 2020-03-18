<#import "light.ftl" as light>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Traffic Light</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="traffic-light-container" id="trafficLights" v-bind:class="[darkMode ? 'body-dark':'']">
  <div class="row">
    <div class="col-sm-3 traffic-light-card" v-for="trafficLight in trafficLights">
      <div class="card mb-4 shadow-sm" v-bind:class="[darkMode ? 'card-dark':'']">
        <div class="card-header" v-bind:class="[darkMode ? 'card-header-dark':'']">
          <a v-bind:href="'/' + trafficLight.id + '/edit'" class="user">
            <div class="float-left">
            </div>
            <div class="float-left border rounded-circle traffic-light bg-danger"
                 v-if="trafficLight.trafficLight === 'RED'"></div>
            <div class="float-left border rounded-circle traffic-light bg-warning"
                 v-if="trafficLight.trafficLight === 'AMBER'"></div>
            <div class="float-left border rounded-circle traffic-light bg-success"
                 v-if="trafficLight.trafficLight === 'GREEN'"></div>
            <div class="float-left border rounded-circle traffic-light"
                 v-if="trafficLight.trafficLight === 'OFF'"></div>
            <h3 class="float-left font-weight-normal ml-md-3 mr-md-3" data-toggle="tooltip" data-placement="bottom"
                v-bind:title="'Last updated ' + moment(trafficLight.lastUpdated).format('HH:mm DD/MM/YY')">
              {{trafficLight.user}}</h3>
          </a>
          <h3 class="float-left ml-1"
               v-if="trafficLight.workingFromHome == true" data-toggle="tooltip" data-placement="bottom"
               title="This person is working remotely" v-bind:class="[darkMode ? 'additional-icon-dark':'']">
            <span class="badge badge-primary">
              <span class="fas fa-home"></span> Remote
            </span>
          </h3>
          <h3 class="float-left ml-1"
              v-if="trafficLight.awayFromKeyboard == true" data-toggle="tooltip" data-placement="bottom"
              title="This person may be away from their keyboard" v-bind:class="[darkMode ? 'additional-icon-dark':'']">
            <span class="badge badge-warning">
              <span class="fas fa-keyboard"></span> AFK
            </span>
          </h3>
          <h3 class="float-left ml-1"
               v-if="(new Date(trafficLight.lastUpdated).setHours(0,0,0,0) < new Date().setHours(0,0,0,0)) && trafficLight.trafficLight != 'OFF'"
               data-toggle="tooltip" data-placement="bottom"
               title="This person has not updated their traffic light today"
               v-bind:class="[darkMode ? 'additional-icon-dark':'']">
            <span class="badge badge-danger">
              <span class="fas fa-times"></span> Not updated
            </span>
          </h3>
        </div>
        <div class="card-body" v-if="!messageHidden" v-bind:class="[darkMode ? 'card-body-dark':'']">
          <p class="message" style="white-space: pre-wrap;">{{trafficLight.message}}</p>
        </div>
      </div>
    </div>
    <div class="col-sm-3 traffic-light-card">
      <div class="card mb-4 shadow-sm" v-bind:class="[darkMode ? 'card-dark':'']">
        <a href="/create">
          <div class="card-body" v-bind:class="[darkMode ? 'card-body-dark':'']">
            <div class="align-middle text-center" v-bind:class="[darkMode ? 'additional-icon-dark':'']">
              <i class="fas fa-user-plus add-traffic-light" v-bind:class="[darkMode ? 'additional-icon-dark':'']"></i>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
  <div class="row float-right">
    <div class="btn-group btn-group-toggle mr-1" data-toggle="buttons">
      <label class="btn btn-light mode-toggler" v-bind:class="{ active: sortBy == 'ALPHA' }" @click="setSortBy('ALPHA')">
        <input type="radio" name="sort" id="sort-alpha" autocomplete="off" :active="sortBy == 'alpha'">
        <span class="fas fa-sort-alpha-up"></span> Alpha
      </label>
      <label class="btn btn-light mode-toggler" v-bind:class="{ active: sortBy == 'UPDATED' }" @click="setSortBy('UPDATED')">
        <input type="radio" name="sort" id="sort-updated" autocomplete="off" :active="sortBy == 'updated'">
        <span class="fas fa-clock"></span> Updated
      </label>
    </div>
    <button @click.stop.prevent="toggleMessageHidden" class="btn btn-light mode-toggler mr-1"><span class="fas fa-comment-dots"></span> Message Display Mode</button>
    <button @click.stop.prevent="toggleDarkMode" class="btn btn-light mode-toggler"><span class="fas fa-adjust"></span> Dark Mode</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    var app = new Vue({
        el: '#trafficLights',
        data: {
            trafficLights: [],
            darkMode: false,
            messageHidden: false,
            moment: moment,
            cookies: Cookies,
            sortBy: 'UPDATED',
        },
        methods: {
            toggleDarkMode: function () {
                this.darkMode = !this.darkMode;
                Cookies.set('darkMode', this.darkMode);
            },
            toggleMessageHidden: function () {
                this.messageHidden = !this.messageHidden;
                Cookies.set('messageHidden', this.messageHidden);
            },
            setSortBy: function (sortBy) {
                this.sortBy = sortBy;
                Cookies.set('sortBy', this.sortBy);
                this.getData();
            },
            getData: function () {
                var url = '/rest/traffic-lights';
                if (this.sortBy != null) {
                  url = url + '?order=' + this.sortBy;
                }
                axios
                    .get(url)
                    .then(response => (this.trafficLights = response.data));
                $('[data-toggle="tooltip"]').tooltip();
            },
            pollData: function () {
                this.polling = setInterval(() => {
                    this.getData()
                }, 3000);
            },
        },
        beforeDestroy() {
            clearInterval(this.polling)
        },
        mounted() {
            if (Cookies.get('sortBy') != null) {
              this.sortBy = Cookies.get('sortBy');
            };
            this.getData();
            this.pollData();
            this.darkMode = Cookies.get('darkMode') === "true";
            this.messageHidden = Cookies.get('messageHidden') === "true";

        },
    })
</script>
</body>
</html>