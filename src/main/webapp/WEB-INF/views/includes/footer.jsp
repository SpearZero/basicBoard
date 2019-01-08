<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- 여기서부터 푸터 -->
    <script src="/resources/js/jquery-3.3.1.slim.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#header-navi ul li a").click(function(){
                $('li a').removeClass("active");
                $(this).addClass("active");
            })
        })
    </script>
</body>
</html>