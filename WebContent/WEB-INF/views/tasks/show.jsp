<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
                <h2>id : ${task.id} のタスクの詳細ページ</h2>
                <table>
                    <tbody>
                    <tr>
                        <th>タスク</th>
                        <td><c:out value="${task.content}" /></td>
                    </tr>
                    <tr>
                        <th>作成日時</th>
                        <td><fmt:formatDate value="${task.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                    <tr>
                        <th>更新日時</th>
                        <td><fmt:formatDate value="${task.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                    <p><a href="<c:url value='/index' />"></a></p>
                    <p><a href="<c:url value='/edit?id=${task.id}' />">このタスクを編集する</a></p>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>