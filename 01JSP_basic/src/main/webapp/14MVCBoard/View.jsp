<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판 - 상세 보기(View)</title>
</head>
<body>
<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>번호</td> <td>${ board.idx }</td>
        <td>작성자</td> <td>${ board.name }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ board.postdate }</td>
        <td>조회수</td> <td>${ board.visitcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ board.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">${ board.content }</td>
    </tr>

    <!-- 첨부파일 -->
    <tr>
        <td>첨부파일</td>
        <td>
            <c:if test="${ not empty board.ofile }">
	            ${ board.ofile }
	            <a href="../mvcboard/download.do?ofile=${ board.ofile }&sfile=${ board.sfile }&idx=${ board.idx }">
	                [다운로드]
	            </a>
            </c:if>
        </td>
         <td>다운로드수</td>
        <td>${ board.downcount }</td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.idx }&pageno=${ param.pageno }';">
                수정하기
            </button>
            <button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.idx }&pageno=${ param.pageno }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='../mvcboard/list.do?pageno=${ param.pageno }';">
                목록으로
            </button>
        </td>
    </tr>
</table>
</body>
</html>
