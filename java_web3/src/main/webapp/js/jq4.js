$(document).ready(function() {
	// html(text) 읽기
	$("#test1").on("click",function() { // on, bind 쓰면 이벤트 여러개 쓸 수 있음
		// alert("a");
		$("#disp").empty();
		// $("#disp").load("jq4data.html"); // html을 단순히 text로 읽기, txt, csv, 
		$("#disp").hide().load("jq4data.html", function() {
			$(this).fadeIn(); // effect 처리 / 대신 메모리 많이 차지함
		});
	}); 
	// json 읽기
	$("#test2").click(function() {
		$.getJSON("jq4json.jsp",function(datas){
			// alert(datas);
			$("#disp").empty();
			
			let items = [];
			$.each(datas, function(index, data) {
				// alert(index + " " + data);
				let str = "";
				str += "<ul>";
				str += "<li>" +data["code"]+" "+data["sang"]+ " "+
						data["su"]+" "+data["dan"]+"</li>";
				str += "</ul>";
				items.push(str);
			});
			$("#disp").html(items);  // html():innerHTML, text():innerText
			}).fail(function() {
				$("#disp").text("test2 처리 에러")
		});
	});
	// xml 읽기
	$("#test3").click(function() {
		// $.post("jq4xml.jsp", function(datas){
		$.get("jq4xml.jsp", function(datas){
			// alert(datas);
			// alert($(datas).find("sangpum").length);
			$("#disp").empty();
			$(datas).find("sangpum").each(function() {
				let product = $(this);
				let str = "<div>";
				str += product.find("code").text() + " ";
				str += product.find("sang").text() + " ";
				str += product.find("su").text() + " ";
				str += product.find("dan").text();
				str += "</div>"
				
				$("#disp").append(str);
			});
		}).fail(function() {
				$("#disp").text("test3 처리 에러")	
		});
	});
	
	// json 읽기
	$("#test4").click(function() {
		$("#disp").empty();
		
		$.ajax({
			type:"get",  // 요청 방식 post방식도 가능
			url:"jq4json.jsp",
			// data:{"code":3, "irum":"홍길동"},  // 요청과 동시에 서버로 자료 전송
			dataType:"json",  // 반환형
			success:function(datas){
				// alert(datas);
				let str = "";
				let count = 0;
				str = "<table border='1'>";
				str += "<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>"
				$.each(datas, function(idx,data){
					str += "<tr>";
					str += "<td>" + data["code"]+ "</td>";
					str += "<td>" + data.sang+ "</td>"; // 둘다 같은 방법
					str += "<td>" + data["su"]+ "</td>";
					str += "<td>" + data["dan"]+ "</td>";
					str += "</tr>";
					count++;
				})
				str += "</table>";
				$("#disp").append(str);
				$("#disp").append("건수 : "+count+"개");
			},
		error:function(){
				$("#disp").text("test4 처리 에러");
			}	
		});
	});
		
	// xml 읽기
	$("#test5").click(function() {
		$("#disp").empty();
		
		$.ajax({
			type:"get",  // 요청 방식 post방식도 가능
			url:"jq4xml.jsp",
			dataType:"xml",  // 반환형
			success:function(datas){
				// alert(datas);
				let str = "";
				let count = 0;
				str = "<table border='1'>";
				str += "<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>"
				
				$(datas).find("sangpum").each(function(){
					str += "<tr>";
					str += "<td>" +$(this).find("code").text() + "</td>";
					str += "<td>" +$(this).find("sang").text() + "</td>";
					str += "<td>" +$(this).find("su").text() + "</td>";
					str += "<td>" +$(this).find("dan").text() + "</td>";
					str += "</tr>";
					count++;
				});
				
				str += "</table>";
				$("#disp").append(str);
				$("#disp").append("건수 : "+count);
			},
		error:function(){
				$("#disp").text("test5 처리 에러")	
			}	
		});
	});	
});