$(document).ready(function() {
		$("#search").click(function() {
		$("#disp").empty();
		
		let buser_name = $("#buser").val();
		if(buser_name===""){
			alert("부서명을 입력하세요");
			$("#buser").focus();
			return;
		}
		
		$.ajax({
			type:"get",  
			url:"jq5json.jsp",
			data:{"buser":buser_name},
			dataType:"json",  
			success:function(datas){
				let str = "";
				let count = 0;
				str = "<table border='1'>";
				str += "<tr><th>사번</th><th>이름</th><th>직급</th><th>성별</th></tr>"
				$.each(datas, function(idx,data){
					str += "<tr>";
					str += "<td>" + data.jikwon_no+ "</td>";
					str += "<td>" + data.jikwon_name+ "</td>"; 
					str += "<td>" + data.jikwon_jik+ "</td>";
					str += "<td>" + data.jikwon_gen+ "</td>";
					str += "</tr>";
					count++;
				})
				str += "</table>";
				$("#disp").append(str);
				$("#disp").append("건수 : "+count+"개");
			},
		error:function(){
				$("#disp").text("test1 처리 에러");
			}	
		});
	});
		
	});