<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline"></form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new order
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="/main" class="form-inline">
                <br>
                <select name="dessert" size="1">
                    <option value="napoleon">NAPOLEON</option>
                    <option value="cheesecake">CHEESECAKE</option>
                    <option value="tiramisu">TIRAMISU</option>
                </select>
                <br>
                <button type="submit" class="btn btn-primary ml-2">Submit</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </div>
    </div>

    <#list orders as order>
        <div>
            <span>${order.dessert}</span>
            <i>${order.price}</i>
            <#if order.accepted == true>
                <strong>accepted</strong>
            <#else>
                <strong>in process</strong>
            </#if>
        </div>
    <#else>
        No orders
    </#list>
    <@c.pricelist></@c.pricelist>
</@c.page>
