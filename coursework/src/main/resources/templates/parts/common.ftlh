<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Confectionery</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    </head>
    <body>
    <#include "navbar.ftlh">
    <div class="container mt-5">
        <#nested>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>

<#macro pricelist>
    <div>
        <table align="right" vertical-align="middle" style="border:2px solid lightgray" cellpadding="2px" border-spacing="20px">
            <thead>
            <tr style="background-color: lightblue; border:2px solid lightgray">
                <th width="60%">Dessert</th>
                <th width="30%" align="center">Price</th>
            </tr>
            </thead>
            <tbody>
            <tr style="background-color: aliceblue">
                <td>Napoleon</td>
                <td align="right">150.00₴</td>
            </tr>
            <tr style="background-color: aliceblue">
                <td>Tiramisu</td>
                <td align="right">100.00₴</td>
            </tr>
            <tr style="background-color: aliceblue">
                <td>Cheesecake</td>
                <td align="right">80.00₴</td>
            </tr>
            </tbody>
        </table>
    </div>
</#macro>