<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
   
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<html>
<head>
    <title>Promotion 만들기 </title>
   	
  
    <script type="text/javascript">
    
    		//selectbox 선택된 값 확인 
		function select_benefit(){
			$("#manageTp option:checked").text()
				alert("selected Value : " + $("#benefit_code option:checked").val())	
				alert("selected Value : " + $("input[name=promo_type]:checked").val())
		}
    
        // 필수 입력정보 혜택이 제대로 선택되었는지 확인 
        function checkValue()
        {
           var selected_benefit = $("#benefit_code option:checked").val()
           if( selected_benefit == '00'){
                alert("혜택종류를 선택하세요." );
                return false;
            }
           
        }
	    	
    </script>
    
</head>
<body>

    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">프로모션 만들기</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 /getBenefit.jsp -->
        <form method="post" action="/getBenefit" name="Promo_info" onsubmit="return checkValue()">
            <table>
               
                <tr>
                    <td id="title">보상형태</td>
                    <td>
                        <input type="radio" name="promo_type" value="1" checked >나혼자
                        <input type="radio" name="promo_type" value="2" >다함께
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">보상종류</td>
                    <td>
                         <select id="benefit_code" name="benefit_code" onchange="select_benefit()">
                            <option value="00">혜택선택</option>
                            <option value="01" >할인쿠폰</option>
                            <option value="02">Point적</option>
                            <option value="03" >3</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="다음">  <input type="button" value="취소">
        </form>
    </div>
</body>
</html>