<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/base.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<link rel="stylesheet" type="text/css" href="/css/padm/cms.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.4.min.css">

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="/js/flatui-radio.js"></script>
<script type="text/javascript" src="/js/pager.js"></script>

<!-- bootstrap-table -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-table.css">
<script type="text/javascript" src="/js/bootstrap-table.js"></script>

<!-- x-editable (bootstrap 3) -->
<link rel="stylesheet" href="/css/bootstrap-editable.css">
<script type="text/javascript" src="/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-table-editable.min.js"></script> 

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">


.procudt_detail_icon {
    display: inline-block;
    width: 62px;
    height: 16px;
    background: url(//image.melon.co.kr/resource/image/web/cm/bg_icon_product.png) no-repeat 0 0;
    font-size: 0;
    line-height: 0;
    vertical-align: top;
}

.icon.mobile {
    background-position: 0 -20px;
}
.icon.pc {
    background-position: 0 -41px;
}
</style>

</head>
<body>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
         	<div>
     			<table>
     			<tr>
	     			<td>	
	     				<img id="product_img"  src="/img/product/mini/00000.png" width="250" height="120" style="position: relative;margin: auto;">
					</td>
	     			<td>
	     				<p id ='product_name' style="color: #00b423; font-size: 20px; margin-top: 10px; margin-left: 10px;">스트리밍 클럽</p>
	     				<ul class="product_icon">
							<li><span class="icon" style="font-size: 12px;">모바일 PC</span><span class="txt">무제한 듣기</span></li>
							<li><span class="icon mobile" style="font-size: 12px;">모바일</span><span class="txt">무제한 다운로드</span></li>
							<li><span class="icon pc" style="font-size: 12px;">PC</span><span class="txt">100곡 다운로드</span></li>
						</ul>
	     			</td>
	     			<td>
	     				<input type="radio" name="product_radio" value="test" >
	     			</td>
	     			<td>
	     			
	     			</td>
	     		</tr>
	     		
	     	
     			</table>
         	
         	
         	</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<button type="button" class="btn btn-info btn-lg" id="myBtn">Open Modal</button>


</body>

<script>   

$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>



</script>
</html>