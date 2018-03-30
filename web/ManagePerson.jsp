<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Управление данными о человеке</title>
</head>
<body>

<%
    HashMap<String, String> jsp_parameters = new HashMap<>();
    Person person = new Person();
    String error_message;

    if (request.getAttribute("jsp_parameters") != null) {
        jsp_parameters = (HashMap<String, String>) request.getAttribute("jsp_parameters");
    }

    if (request.getAttribute("person") != null) {
        person = (Person) request.getAttribute("person");
    }

    error_message = jsp_parameters.get("Error Manage Person");
%>

<form action="<%=request.getContextPath()%>/" method="post">
    <input type="hidden" name="id" value="<%=person.getId()%>"/>
    <table align="center" border="1" width="70%">
        <%
            if ((error_message != null) && (!error_message.equals(""))) {
        %>
        <tr>
            <td colspan="2" align="center"><span style="color:red"><%=error_message%></span></td>
        </tr>
        <%
            }
        %>
        <tr>
            <td colspan="2" align="center">Информация о человеке</td>
        </tr>
        <tr>
            <td>Фамилия:</td>
            <td><label>
                <input type="text" name="surname" value="<%=person.getSurname()%>"/>
            </label></td>
        </tr>
        <tr>
            <td>Имя:</td>
            <td><label>
                <input type="text" name="name" value="<%=person.getName()%>"/>
            </label></td>
        </tr>
        <tr>
            <td>Отчество:</td>
            <td><label>
                <input type="text" name="middleName" value="<%=person.getMiddleName()%>"/>
            </label></td>
        </tr>
        <tr>
            <td>Телефоны:</td>
            <td>
                <label>
<textarea name="phones" cols="40" rows="5"><%
    for (String phone : person.getPhones().values()) {
        out.write(phone + "\n");
    }
%></textarea>
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="<%=jsp_parameters.get("next_action")%>"
                       value="<%=jsp_parameters.get("next_action_label")%>"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
