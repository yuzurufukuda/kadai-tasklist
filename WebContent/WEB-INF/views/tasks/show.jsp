<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">
                <h2>id : ${task.id} のタスクの詳細ページ</h2>

                <p>タスク:<c:out value="${task.content}" /></p>
                <p>作成日時<fmt:formatDate value="${task.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                <p>更新日時<fmt:formatDate value="${task.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></p>

                <p><a href="<c:url value='/index' />"></a></p>
                <p><a href="<c:url value='/edit?id=${task.id}' />">このタスクを編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>