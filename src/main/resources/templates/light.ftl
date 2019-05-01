<#macro light trafficLight>
    <div class="col-sm-3">
        <div class="card mb-4 shadow-sm">
            <div class="card-header">
                <div class="float-left">
                    <h5 class="my-0 font-weight-normal">${trafficLight.user}</h5>
                </div>
                <@lightbulb trafficLight/>
            </div>
            <div class="card-body">
                <p><#if trafficLight.message??>${trafficLight.message}</#if></p>
            </div>
        </div>
    </div>
</#macro>

<#macro lightbulb trafficLight>
    <a href="/${trafficLight.id}/edit">
        <#switch trafficLight.trafficLight>
            <#case "RED">
                <div class="float-right border rounded-circle traffic-light bg-danger"></div>
            <#break>
            <#case "AMBER">
                <div class="float-right border rounded-circle traffic-light bg-warning"></div>
            <#break>
            <#case "GREEN">
                <div class="float-right border rounded-circle traffic-light bg-success"></div>
            <#break>
            <#case "OFF">
                <div class="float-right border rounded-circle traffic-light"></div>
            <#break>
        </#switch>
    </a>
</#macro>