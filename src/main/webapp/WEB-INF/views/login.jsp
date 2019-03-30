<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./includes/header.jsp" %>
    <div class="container login">
        <form method="post" action="/login">
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-user"></i></div>
                </div>
                <input type="text" class="form-control" name="username" placeholder="id">
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="password" placeholder="password">
            </div>
            <div class="col-md-6 mx-auto">
                <div class="float-right">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
    </div>
<%@ include file="./includes/footer.jsp" %>