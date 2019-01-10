<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
	
    <div class="container board">
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">글 제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">날짜</th>
                        <th scope="col">수정날짜</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}"/></td>
							<td><c:out value="${board.title }"/></td>
							<td><c:out value="${board.writer}"/></td>
							<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="col-lg-12 d-flex justify-content-end mb-3">
                <button class="btn btn-primary">글쓰기</button>
            </div>
            <div id="pagenNavi" class="col-lg-12 d-flex justify-content-center mb-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </nav>
            </div>
            <div class="input-group col-lg-6 mx-auto">
                <select name="searchType" id="searchType" class="custom-select col-lg-3">
                    <option selected>...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
                <input type="text" class="form-control" name="searchword">
                <button type="button" class="btn btn-outline-primary">검색</button>
            </div>
        </div>
    </div>
    
<%@ include file="../includes/footer.jsp" %>