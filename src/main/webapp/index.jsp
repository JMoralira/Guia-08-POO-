<%@page import="java.util.Base64"%>
<%@page import="com.sv.udb.controlador.EquiposCtrl"%>
<%@page import="com.sv.udb.modelo.Equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
              <br />
        <h1>${mensAler}</h1>
        <form method="POST" action="EquiposServ" name="DEMO" enctype="multipart/form-data">
                    <label for="codi"><fmt:message key="label.id"/></label>
                    <input type="text" name="codi" id="codi" value="${codi}" readonly> <br>
                    <label for="nomb"><fmt:message key="label.nombre"/></label>
                    <input type="text" name="nomb" id="nomb" value="${nomb}" required> <br>
                    <label for="desc"><fmt:message key="label.desc"/></label>
                    <input type="text" name="desc" id="desc" value="${desc}" required> <br>
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
                <button class="btn waves-effect waves-light" type="submit" name="btonEqui" value="Guardar"> <fmt:message key="label.guardar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btonEqui" value="Modificar"><fmt:message key="label.modificar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btonEqui" value="Eliminar"><fmt:message key="label.eliminar"/>
                <i class="material-icons right">send</i>
                </button>
                <button class="btn waves-effect waves-light" type="submit" name="btonEqui" value="Nuevo"><fmt:message key="label.nuevo"/>
                <i class="material-icons right">send</i>
                </button>
        <ul>
            <li><a href="juga.jsp"><fmt:message key="label.juga"/></a></li>
        </ul>            
        </form>
        
        <h1><fmt:message key="label.tabla"/></h1>
        <form method="POST" action="EquiposServ" name="TABLA">
        <table>
            <thead>
            <tr>
                <th><fmt:message key="label.id"/></th>
                <th><fmt:message key="label.nombre"/></th>
                <th><fmt:message key="label.desc"/></th>      
                <th><fmt:message key="label.img"/></th>
            </tr>
            </thead>
            <tbody>
                
            <%
            for (Equipos temp : new EquiposCtrl().consTodo())
            {
                byte[] photo = temp.getImag();
                    String bphoto = Base64.getEncoder().encodeToString(photo);
            %>
            <tr>
                <td><p><input name="codiEquiRadi" type="radio" id="<%=temp.getCodiEqui()%>" value="<%=temp.getCodiEqui()%>" />
                        <label for="<%=temp.getCodiEqui()%>"></label></p></td>
                <td><%= temp.getNombEqui() %></td>
                <td><%= temp.getDescEqui() %></td>                
                 <td><img src="data:image/*;base64,<%=bphoto%>" class="materialboxed" width="100" height="100"></td>
            </tr>
            <%
            }
            %>
            </tbody>
        </table>
            <button class="btn waves-effect waves-light" type="submit" name="btonEqui" value="Consultar"><fmt:message key="label.cons"/>
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
