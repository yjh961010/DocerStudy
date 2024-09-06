<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .winner_container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            color: #777;
        }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <jsp:include page="../header.jsp"/>
<div class="winner_container">
        <h1>당첨자 목록</h1>
        <table>
            <thead>
                <tr>
                    <th>상품</th>
                    <th>당첨금액</th>
                    <th>당첨자</th>	
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dto" items="${winnerList}">
                <tr>
                    <td>${dto.product_name}</td>
                    <td>${dto.accumulated_amount}</td>
                    <td>${dto.winner}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <jsp:include page="../footer.jsp"/>
