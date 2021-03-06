<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
	textarea {
		resize : none;
	}
	
	.uploadResult {
		width : 100%;
		background-color : gray;
	}
	
	.uploadResult ul {
		display : flex;
		flex-flow : row;
		justify-content : center;
		align-items : center;
	}
	
	.uploadResult ul li {
		list-style : none;
		padding : 10px;
		align-content : center;
		text-align : center;
	}
	
	.uploadResult ul li img {
		width : 100px;
	}
	
	.uploadResult ul li span {
		color : white;
	}
	
	.bigPicutreWrapper {
		position : absolute;
		display : none;
		justify-content: center;
		align-items: center;
		top : 0%;
		width : 100%;
		height : 100%;
		background-color: gray;
		z-index : 100;
		background : rgba(255,255,255,0.5);
	}
	
	.bigPicture {
		position: relative;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width : 600px;
	}
</style>

<div class="container board">
	<div class="container writer">
		<form action="/board/register" method="post" id="registerForm">
			<div class="form-row mb-3">
				<div class="col-md-2">
					<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" maxlength="16">
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" maxlength="66">
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="content" name="content" rows="20" maxlength="666"></textarea>
			</div>
			<div class="row mb-3">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							File Upload
						</div>
						<div class="card-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple />
							</div>
							<div class="uploadResult">
								<ul>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="text-right">
				<button class="btn btn-primary" id="write" data-action="write">글쓰기</button>
				<button class="btn btn-primary" id="cancel" data-action="cancel">취소</button>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function(){
		$("button").click(function(e){
			e.preventDefault();
			
			var action = $(this).data("action");
			var form = $("#registerForm");
			
			if(action === 'write') {
				var inputWriter = $("#writer").val().trim();
				var inputTitle = $("#title").val().trim();
				var inputContent = $("#content").val().trim();
				
				if(!inputWriter.length || !inputTitle.length || !inputContent.length) {
					alert("입력하지 않은 칸이 존재합니다.")
					return;
				}
				
				var str = "";
				
				$(".uploadResult ul li").each(function(i,obj){
					var jobj = $(obj);
					
					str += "<input type='hidden' name='attachList["+ i + "].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+ i + "].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+ i + "].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+ i + "].fileType' value='"+jobj.data("type")+"'>";
				});
				
				form.append(str).submit();
			} else {
				location.href = "/board/list";
			}
		})
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return;
			}			
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			
			return true;
		}
		
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++) {
				
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadResult(result);
				}
			});
		});
		
		$(".uploadResult").on("click", "button", function(e) {
			console.log("delete File");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url : '/deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
	});
	
	function showUploadResult(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.length == 0) { return; }
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			// image type
			if(obj.image) {
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid + "_"+ obj.fileName);
				
				str += "<li data-path='" + obj.uploadPath +"' data-uuid='" + obj.uuid +"' data-filename='" + obj.fileName +"' data-type='" + obj.image + "'><div>";
				str += "<span> " + obj.fileName + "</span>";
				str += "<button type='button' class='btn btn-warning btn-sm' data-file=\'"+ fileCallPath + "\' data-type='image'><i class='fas fa-times'></i></button><br>";
				str += "<img src = '/display?fileName=" + fileCallPath + "'>";
				str += "</div>";
				str += "</li>";
			} else {
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='" + obj.uploadPath +"' data-uuid='" + obj.uuid +"' data-filename='" + obj.fileName +"' data-type='" + obj.image +"'><div>";
				str += "<span> " + obj.fileName + "</span>";
				str += "<button type='button' class='btn btn-warning btn-sm' data-file=\'" + fileCallPath + "\' data-type='file'><i class='fas fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str += "</li>";
			}
		});
		
		uploadUL.append(str);
	}
</script>
<%@ include file="../includes/footer.jsp"%>