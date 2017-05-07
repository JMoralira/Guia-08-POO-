<%-- 
    Document   : juga
    Created on : 03-19-2017, 03:15:52 PM
    Author     : Jose Lira
--%>
<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page import="com.sv.udb.controlador.JugadoresCtrl"%>
<%@page import="com.sv.udb.modelo.Jugadores"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%-- language maneja el idioma actual --%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.me.jsp.bundle.file" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='webjars/materialize/0.97.3/dist/css/materialize.min.css'>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript" src="webjars/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/materialize/0.97.3/dist/js/materialize.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form>
                <fmt:message key="label.select_language" />: 
                <select id="language" name="language" onchange="submit();">
                   <option value="es_ES" 
                     <c:if test="${language=='es_ES'}">selected</c:if>>
                     <fmt:message key="label.spanish" />
                   </option>
                   <option value="en_US" 
                     <c:if test="${language=='en_US'}">selected</c:if>>
                     <fmt:message key="label.english" />
                   </option>
                </select>
            </form> 

         <form method="POST" action="JugadoresServ" name="DEMO" enctype="multipart/form-data">
        <h1>${mensAler}</h1>
        <label><fmt:message key="label.id"/></label>
        <input type="text" name="codi" id="codi" value="${codi}" readonly> <br>
        <label><fmt:message key="label.cod"/></label>
        <select id="cmbEquipo" name="cmbEquipo" value="${cmbEquipo}">
            
            <option  disabled selected> <fmt:message key="label.equipo2"/></option>
            <%                
                for(Equipos temp : new EquiposCtrl().consTodo())
                {
            %>
            <option value="<%=temp.getCodiEqui()%>"><%=temp.getNombEqui()%></option>;
            <%
                }
            %>
        </select> <br>
        <label><fmt:message key="label.nombre"/></label>
        <input type="text" name="nomb" id="nomb" value="${nomb}" required> <br>
        <label><fmt:message key="label.edad"/></label>
        <input type="text" name="edad" id="edad" value="${edad}" required> <br>
        <label><fmt:message key="label.altura"/></label>
        <input type="text" name="altu" id="altu" value="${altu}" required> <br>
        <label><fmt:message key="label.peso"/></label>
        <input type="text" name="peso" id="peso" value="${peso}" required> 
        
          <div class="input-field col s12 m12 l12">
            <div class="file-field input-field">
            <button class="btn">
         <i class="material-icons">insert_photo</i>
        <input type='file' name='imagen' id="img"/> 
        </button>
                <div class="file-path-wrapper">
                            <input class="file-path validate" name="ima" type="text" value="${ima}" placeholder='1200x1200px máx., 2MB máx., PNG/JPG/GIF '>
                </div> 
        </div>
        </div>
      
                <button class="btn waves-effect waves-light" type="submit" name="btoJuga" value="Guardar"><fmt:message key="label.guardar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btoJuga" value="Modificar"><fmt:message key="label.modificar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btoJuga" value="Eliminar"><fmt:message key="label.eliminar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btoJuga" value="Nuevo"><fmt:message key="label.nuevo"/> 
                <i class="material-icons right">send</i>
                </button>
        <ul>
            <li><a href="index.jsp"><fmt:message key="label.equi"/></a></li>
        </ul>
        </form>
        
        <h1><fmt:message key="label.tabla"/></h1>
        <form method="POST" action="JugadoresServ" name="TABLA">
        <table border="1">
            <thead>
            <tr>
                <th><fmt:message key="label.id"/></th>
                <th><fmt:message key="label.cod"/></th>
                <th><fmt:message key="label.nombre"/></th>
                <th><fmt:message key="label.edad"/></th>
                <th><fmt:message key="label.altura"/></th>
                <th><fmt:message key="label.peso"/></th>
                <th><fmt:message key="label.img"/></th>
            </tr>
            </thead>
            <tbody>
            <%
            for (Jugadores temp : new JugadoresCtrl().constTodo())
            {
                 byte[] photo = temp.getImag();
                    String bphoto = Base64.getEncoder().encodeToString(photo);

            %>
            <tr>
                <td><p><input type="radio" name="codiJugaRadi" value="<%= temp.getCodiJuga() %>" id="<%= temp.getCodiJuga() %>"/>
                        <label for="<%=temp.getCodiJuga()%>"></label></p></td>
                <td><%= temp.getCodiEqui() %></td>
                <td><%= temp.getNombJuga() %></td>
                <td><%= temp.getEdadJuga() %></td>
                <td><%= temp.getAltuJuga() %></td>
                <td><%= temp.getPesoJuga() %></td>
                <td><img src="data:image/*;base64,<%=bphoto%>" class="materialboxed" width="100" height="100"></td>
            </tr>
            <%
            }
            %>
            </tbody>
        </table>
            <button class="btn waves-effect waves-light" type="submit" name="btoJuga" value="Consultar"><fmt:message key="label.cons"/>
            <i class="material-icons right">send</i>
            </button>
        </form>
        </div>
            <script>
        $(document).ready(function() {
            $('select').material_select();
          });
    </script>
    </body>
</html>
