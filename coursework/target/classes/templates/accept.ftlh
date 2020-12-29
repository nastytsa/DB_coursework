<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/accept" class="form-inline">
                <br>
                <select name="filter" size="1">
                    <option value="all">ALL</option>
                    <option value="accepted">ACCEPTED</option>
                    <option value="in process">IN PROCESS</option>

                </select>
                <br><br>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary ml-2">Show orders</button>
            </form>
        </div>
    </div>

    <#list orders as order>
        <div>
            <span>${order.customer.username}</span>
            <span>${order.dessert}</span>
            <i>${order.price}</i>
            <#if order.accepted == true>
                <strong>accepted</strong>
            <#else>
                <form method="post" action="/accept" class="form-inline">
                    <button type="submit" class="btn btn-primary ml-2">Accept</button>
                    <input type="hidden" name="order_id" value="${order.id}" />
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </form>
            </#if>
        </div>
    <#else>
        No orders
    </#list>
</@c.page>