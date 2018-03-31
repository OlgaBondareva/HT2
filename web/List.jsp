<%@ page import="app.Person" %>
<%@ page import="app.PhoneBook" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Список людей</title>
    <link href="${pageContext.request.contextPath}styles/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%
    //PhoneBook phoneBook = PhoneBook.getInstance();
    String user_message;
    HashMap<String, String> jsp_parameters = new HashMap<>();
    PhoneBook phoneBook = (PhoneBook) request.getAttribute("phoneBook");

    if (request.getAttribute("jsp_parameters") != null) {
        jsp_parameters = (HashMap<String, String>) request.getAttribute("jsp_parameters");
    }

    user_message = jsp_parameters.get("current_action_result_label");
%>

<table class="main-table" align="center" border="1" width="90%">

    <%
        if ((user_message != null) && (!user_message.equals(""))) {
    %>
    <tr>
        <td colspan="6" align="center"><%=user_message%>
        </td>
    </tr>
    <%
        }
    %>

    <tr>
        <td colspan="6" align="center"><a href="<%=request.getContextPath()%>/?action=add">Добавить запись</a></td>
    </tr>
    <tr>
        <td align="center" style="font-weight: bold;">Фамилия</td>
        <td align="center" style="font-weight: bold;">Имя</td>
        <td align="center" style="font-weight: bold;">Отчество</td>
        <td align="center" style="font-weight: bold;">Телефон(ы)</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
    </tr>

    <%
        for (Person person : phoneBook.getContents().values()) {

    %>
    <tr>
        <td><%=person.getSurname()%>
        </td>
        <td><%=person.getName()%>
        </td>
        <td><%=person.getMiddleName()%>
        </td>
        <td>
            <%
                for (String phone : person.getPhones().values()) {
            %>
            <%=phone%><br/>
            <%
                }
            %>
        </td>
        <td><a href="<%=request.getContextPath()%>/?action=edit&id=<%=person.getId()%>">Редактировать</a></td>
        <td><a href="<%=request.getContextPath()%>/?action=delete&id=<%=person.getId()%>">Удалить</a></td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>