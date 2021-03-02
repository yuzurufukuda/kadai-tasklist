<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<import url="../layout/app.jsp">
    <h2>タスク新規作成ページ</h2>
    <form method="POST" action=<c:url value='/create' />>
        <c:import url="_form.jsp" />
    </form>
    <p><a href="<c:url value='/index' />">一覧に戻る</a></p>
</import>