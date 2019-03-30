<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./includes/header.jsp" %>
    <div class="container signup">
        <form>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-user"></i></div>
                </div>
                <input type="text" class="form-control" name="username" placeholder="아이디">
                <button class="btn btn-light ml-2">아이디 중복 확인</button>
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="password" placeholder="비밀번호">
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-key"></i></div>
                </div>
                <input type="password" class="form-control" name="passwordCheck" placeholder="비밀번호 확인">
            </div>
            <div class="input-group mb-3 col-md-6 mx-auto">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                </div>
                <input type="email" class="form-control" name="email" placeholder="이메일">
            </div>
            <div class="col-md-6 mx-auto">
                <div class="float-right">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </div>
        </form>
    </div>
<%@ include file="./includes/footer.jsp" %>