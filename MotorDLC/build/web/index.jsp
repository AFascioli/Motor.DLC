<%-- 
    Document   : Resultado
    Created on : Apr 24, 2018, 10:14:20 AM
    Author     : dlcusr
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Buscador</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        
                <header class="header">
            Dise&nacute;o de Lenguajes de Consulta, 2018
        </header>

        <div id="cuerpo" style="text-align: center" >
            <label id="campobusqueda" style="font-size: 30px; ">
                Motor de b&uacute;squeda &nbsp;
            </label>
            <div class="col-md-12" style="line-height: 40px;">
            <form method="post" action="servletconsulta2">
                <div style="text-align: center">
                    <input class="form-control" type="text" style="margin-left: 20%; margin-right: 25%" placeholder="Ingrese su b&uacute;squeda" maxlength="120" id="txt_busqueda" name ="txt_busqueda" autofocus/>
                </div>
                    <input class="btn btn-md btn-primary" style="margin-left: 20%;" type="submit" value="Buscar" name="buscar" />
            </form>
            <form method="post" action="servletindexar">  
                    <input class="btn btn-md btn-primary" style="margin-right: 20%;" type="submit" value="Indexar nuevos archivos" name="index" />
            </form>
        </div>
    </div>
        
            <div class="col-md-12" id="resultado">
                <c:choose>
                    <c:when test="${resultado==null}">
                        <label>ERROR</label>
                    </c:when>
                    <c:otherwise>
                        <div    class="table-responsive">
                            <table class="table table-striped">
                                <div id="colname">
                                <tr>
                                    <th>T&iacute;tulo</th>
                                    <th>Nombre de documento</th>
                                    <th>Peso</th>
                                    <th>Frecuencia de los terminos</th>
                                </tr>
                                </div>

                                <c:forEach items="${resultado}" var="documento" begin="0" end="5" >
                                    <tr>
                                        <td><a href="${documento.nombre}"><c:out value="${documento.titulo}"> </c:out></a></td>
                                        <td><c:out value="${documento.nombre}"> </c:out> </td>
                                        <td><c:out value="${documento.peso}"> </c:out></td>
                                        </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        
        <footer class="footer">
            Autores: Ponce Diego, Bargiano Florencia y Fascioli Agust&iacute;n
        </footer> 

    </body>
</html>

