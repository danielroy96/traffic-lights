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
<div class="traffic-light-container">
  <div class="row" id="trafficLights">
    <div class="col-sm-3" v-for="trafficLight in trafficLights">
      <div class="card mb-4 shadow-sm">
        <div class="card-header">
          <a v-bind:href="'/' + trafficLight.id + '/edit'" class="user">
            <div class="float-left">
              <h3 class="my-0 font-weight-normal" data-toggle="tooltip" data-placement="bottom"
                  v-bind:title="'Last updated ' + moment(trafficLight.lastUpdated).format('HH:mm DD/MM/YY')">
                {{trafficLight.user}}</h3>
            </div>
            <div class="float-right border rounded-circle traffic-light bg-danger"
                 v-if="trafficLight.trafficLight === 'RED'"></div>
            <div class="float-right border rounded-circle traffic-light bg-warning"
                 v-if="trafficLight.trafficLight === 'AMBER'"></div>
            <div class="float-right border rounded-circle traffic-light bg-success"
                 v-if="trafficLight.trafficLight === 'GREEN'"></div>
            <div class="float-right border rounded-circle traffic-light"
                 v-if="trafficLight.trafficLight === 'OFF'"></div>
          </a>
          <div class="float-right working-from-home fas fa-home"
               v-if="trafficLight.workingFromHome == true"></div>
        </div>
        <div class="card-body">
          <p class="message">{{trafficLight.message}}</p>
        </div>
      </div>
    </div>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    var app = new Vue({
        el: '#trafficLights',
        data: {
            message: 'Hello Vue!',
            trafficLights: [],
            moment: moment,
        },
        methods: {
            getData() {
                axios
                    .get('/rest/traffic-lights')
                    .then(response => (this.trafficLights = response.data));
                $('[data-toggle="tooltip"]').tooltip();
            },
            pollData() {
                this.polling = setInterval(() => {
                    this.getData()
                }, 3000);
            }
        },
        beforeDestroy() {
            clearInterval(this.polling)
        },
        mounted() {
            this.getData();
            this.pollData();
        },
    })
</script>
</body>
</html>