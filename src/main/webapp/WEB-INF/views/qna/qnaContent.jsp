<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/qna/qnaContent.css">
<link rel="stylesheet" type="text/css" href="/css/qna/qnaStyle.css">
<jsp:include page="../header.jsp"/>
<script>
    function checkLogin() {
        alert("로그인이 필요합니다.");
        window.location.href = "/index.do";

    }

    function checkWriteId(hasRole2) {
        // hasRole2가 true일 경우에만 답글 작성 페이지로 이동합니다.
        if (hasRole2 === 'true') {
            window.location.href = "/qna/qnaWrite.do?id=${getQna.id}";
        } else {
            alert("관리자만 답글을 작성할 수 있습니다.");
        }
    }

    function checkUpdateId(username, hasRole2){

        if (username === '${getQna.author}') {
            window.location.href = "/qna/qnaUpdate.do?id=${getQna.id}";
        } else {
            alert("본인만 글만 수정 가능합니다.");
        }

    }

    function checkDeleteId(username, hasRole2) {
        if (username === '${getQna.author}' || hasRole2) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = "/qna/qnaDelete.do?id=${getQna.id}";
            }
        } else {
            alert("본인만 글을 삭제할 수 있습니다.");
        }
    }
</script>
<main>
<div class="qna">
    <div class="header-content">
        <div class="vanner">
            <img alt="main" src="${pageContext.request.contextPath}/img/van.jpg" style="width:898px; height: 280px;">
        </div>
        <div class="login-form">
            <sec:authorize access="isAuthenticated()">
<div class="logview">
    <div class="profile-container">
        <table class="profile-table">
            <tr>
                <td width="50%" class="profile-image-cell">
                    <img src="${pageContext.request.contextPath}/img/${profile.profile}" alt="프로필 이미지" class="profile-img"/>
                </td>
                <td class="profile-info-cell">
                    <div class="profile-info">
                        <strong class="itemfont col" id="nickNameArea">
                            환영합니다<br>
                            <sec:authentication property="principal.username"/>님
                        </strong>
                        <br>
                        <div class="links">
                            <a href="${pageContext.request.contextPath}/member/myPage.do?user=<sec:authentication property="principal.username"/>" class="link-btn">마이페이지</a>
                            <a href="/member/editMemberForm.do?memberID=<sec:authentication property='principal.username'/>" class="link-btn">내 정보 수정</a>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <form action="<c:url value='/logout' />" method="post" class="logout-form">
            <button type="submit" class="logout-btn">로그아웃</button>
        </form>
    </div>
</div>
</sec:authorize>
            <sec:authorize access="isAnonymous()">
                <h2>로그인</h2>
                <form action="<c:url value='/login' />" method="post">
                    <input type="text" name="username" placeholder="사용자 이름" required>
                    <input type="password" name="password" placeholder="비밀번호" required>
                    <button type="submit">로그인</button>
                </form>
                <div class="links">
                    <a href="/find-id">아이디 찾기</a> |
                    <a href="/find-password">비밀번호 찾기</a> |
                    <a href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
                </div>
            </sec:authorize>
        </div>
    </div>
    <h2>글내용 보기</h2>
   <table class="content-table">
        <tr>
            <th>글번호</th>
            <td>${getQna.id}</td>
            <th>조회수</th>
            <td>${getQna.views}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${getQna.author}</td>
            <th>작성일</th>
            <td>${getQna.createtime}</td>
        </tr>
        <tr>
            <th>글제목</th>
            <td colspan="3">${getQna.subject}</td>
        </tr>
        <tr>
            <td colspan="90">
                <div class="textarea-container">
                    <textarea readonly>${getQna.content}</textarea>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: right;">
                <sec:authorize access="isAuthenticated()">
                    <!-- 현재 사용자의 username을 가져옵니다. -->
						<sec:authentication property="principal.username" var="username" />

						<!-- ROLE_2 권한이 있는지 확인하고, JavaScript에 사용할 변수를 설정합니다. -->
						<sec:authorize access="hasRole('ROLE_2')" var="hasRole2">
							<c:set var="hasRole2" value="true" />
						</sec:authorize>
						<c:if test="${hasRole2 == null}">
							<c:set var="hasRole2" value="false" />
						</c:if>
                    <input type="button" value="답글달기" onclick="checkWriteId('${hasRole2}')">
                    <input type="button" value="글수정" onclick="checkUpdateId('${username}', ${hasRole2})">
                    <input type="button" value="글삭제" onclick="checkDeleteId('${username}', ${hasRole2})">
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <input type="button" value="답글달기" onclick="checkLogin()">
                    <input type="button" value="글수정" onclick="checkLogin()">
                    <input type="button" value="글삭제" onclick="checkLogin()">
                </sec:authorize>
                <input type="button" value="글목록" onclick="window.location='/qna/qnaList.do'">
            </td>
        </tr>
    </table>
    <div class="commu-container">
        <div class="community-content">
            <div class="community-posts">
                <div>
                    <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #c0c0c0; margin-bottom: 8px;">
					    <span style="text-align: left;"><h3 style="margin: 0;">공지사항</h3></span>
					    <span style="text-align: left;"><a href="/notice/noticeList.do"> 더보기 + </a></span>
					</div>
                    <table>
                        <thead>
                        <tr class="commu-header">
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dto" items="${noticeList}" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <tr>
                                    <td width="50%" align="left">
                                        <span>&nbsp;&nbsp;</span>
                                        <a href="/notice/noticeView.do?id=${dto.id}">
                                                <c:choose>
                                        <c:when test="${fn:length(dto.subject) > 8}">
                                            ${fn:substring(dto.subject, 0, 8)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${dto.subject}
                                        </c:otherwise>
                                    </c:choose>

                                        </a>
                                    </td>
                                    <td align="center" width="25%">
                                            ${dto.author}
                                    </td>
                                    <td align="center">
                                        <fmt:parseDate var="parsedDate" value="${dto.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${parsedDate}" pattern="MM-dd HH:mm" />
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="community-posts">
                <div>
                   <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #c0c0c0; margin-bottom: 8px;">
					    <span style="text-align: left;"><h3 style="margin: 0;">커뮤니티</h3></span>
					    <span style="text-align: left;"><a href="/commu/commuList.do">더보기 +</a></span>
					</div>
                    <table>
                        <thead>
                        <tr class="commu-header">
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="dto" items="${commuList}" varStatus="status">
                            <c:if test="${status.index < 5}">
                                <tr>
                                    <td width="50%" align="left">
                                        <span>&nbsp;&nbsp;</span>
                                        <a href="/commu/commuContent.do?id=${dto.id}">
                                               <c:choose>
                                        <c:when test="${fn:length(dto.subject) > 8}">
                                            ${fn:substring(dto.subject, 0, 8)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${dto.subject}
                                        </c:otherwise>
                                    </c:choose>

                                        </a>
                                    </td>
                                    <td align="center" width="25%">
                                            ${dto.author}
                                    </td>
                                    <td align="center">
                                        <fmt:parseDate var="parsedDate" value="${dto.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${parsedDate}" pattern="MM-dd HH:mm" />
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
			<div class="community-prizes">
				<div>
					<div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #c0c0c0; margin-bottom: 8px;">
					    <span style="text-align: left;"><h3 style="margin: 0;">전회차 상금</h3></span>
					</div>
					<table>
						<thead>
							<tr class="commu-header">
								<th>상품이름</th>
								<th>누적 금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${sessionScope.winnerList}" varStatus="status">
      						  <tr>
            					<td width="50%" align="left"><span>&nbsp;&nbsp;</span> 
               					 <c:choose>
                    				<c:when test="${fn:length(dto.product_name) > 6}">
                      				  ${fn:substring(dto.product_name, 0, 6)}...
                    				</c:when>
                    			<c:otherwise>
                      				  ${dto.product_name}
                    			</c:otherwise>
                				</c:choose>
           					 </td>
           				<td align="right" width="50%">
                			<fmt:formatNumber value="${dto.accumulated_amount}" type="number" groupingUsed="true" /> 원
            			</td>
        				</tr>
    				</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<jsp:include page="../footer.jsp"/>






