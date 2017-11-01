var linkContsTypeOptionItems = {};
linkContsTypeOptionItems.detail = '<option value="N10006" id="N10006">아티스트ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10002" id="N10002">앨범ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10001" id="N10001">곡명ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10003" id="N10003">영상ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10016" id="N10016">아티스트플레이리스트ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10009" id="N10009">DJ컬렉션ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10017" id="N10017">TV테마ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10018" id="N10018">멤버키</option>';
linkContsTypeOptionItems.detail += '<option value="N10005" id="N10005">플레이리스트ID</option>';
//linkContsTypeOptionItems.detail += '<option value="N10025" id="N10025">멜론라디오채널ID</option>';
linkContsTypeOptionItems.detail += '<option value="N10027" id="N10027">테마ID</option>';
linkContsTypeOptionItems.menu = '<option value="RADIOMAIN" id="RADIOMAIN">멜론라디오메인</option>';
linkContsTypeOptionItems.menu += '<option value="RADIOTOPMENU" id="RADIOTOPMENU">멜론라디오대채널ID</option>';
//linkContsTypeOptionItems.aztalk = '<option value="AZTALK_A" id="AZTALK_A">아티스트ID</option>';
//linkContsTypeOptionItems.aztalk += '<option value="AZTALK_C" id="AZTALK_C">채널ID</option>';
//linkContsTypeOptionItems.aztalk += '<option value="N10026" id="N10026">AZTalk 글ID</option>';
//linkContsTypeOptionItems.aztalk += '<option value="AZTALK_H" id="AZTALK_H">AZTalk 홈</option>';
//linkContsTypeOptionItems.showing = '<option value="SHOWINGHOME" id="SHOWINGHOME">멜론쇼윙 홈</option>';
//linkContsTypeOptionItems.showing += '<option value="N10028" id="N10028">영상 상세</option>';

// 링크타입 RADIO 변경시 발생이벤트[LAYOUT변경]
function fn_link_type(gubun, radioValue){
	if (radioValue == "MA") {
		$("#consInfo"+gubun).show();
		$('#linkTypeGbn'+gubun).css('padding-bottom', '10px');
		$("#linkUrl"+gubun).hide();
	} else {
		$('#linkTypeGbn'+gubun).removeAttr('style');
		$("#consInfo"+gubun).hide();
		$("#linkUrl"+gubun).show();
		$("#contsInfo"+gubun).empty();
	}
}


function fn_link_conts_type(gubun){
	if($("#linkContsTypeCode"+gubun).val()=="N10025" || $("#linkContsTypeCode"+gubun).val()=="N10026"){
		$("#linkContsId"+gubun).val("");
		$("#linkSubContsId"+gubun).val("");
		if($("#linkContsTypeCode"+gubun).val()=="N10026"){
			$('#linkContsIdDiv'+gubun).html('AZtalk 토픽 ID : <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" style=\"width:90px;\" value=\"\"/>');
			$('#linkSubContsIdDiv'+gubun).html('AZtalk 채널ID : <input type=\"text\" name=\"linkSubContsId'+gubun+'\" id=\"linkSubContsId'+gubun+'\" style=\"width:90px;\" value=\"\"/>');
		}else{
			$('#linkContsIdDiv'+gubun).html('소채널 ID : <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" style=\"width:90px;\" value=\"\"/>');
			$('#linkSubContsIdDiv'+gubun).html('멜론라디오 대채널ID : <input type=\"text\" name=\"linkSubContsId'+gubun+'\" id=\"linkSubContsId'+gubun+'\" style=\"width:90px;\" value=\"\"/>');
		}
		$("#linkContsIdDiv"+gubun).show();
		$("#linkSubContsIdDiv"+gubun).show();
		$('#chkContsBtn'+gubun).attr("disabled", false);
		$('#drawContsBtn'+gubun).attr("disabled", true);
	}else if($("#linkContsTypeCode"+gubun).val()=="RADIOMAIN" || $("#linkContsTypeCode"+gubun).val()=="AZTALK_H" || $("#linkContsTypeCode"+gubun).val()=="SHOWINGHOME"){
		$("#linkSubContsId"+gubun).val("");
		$("#linkSubContsIdDiv"+gubun).hide();
		$("#linkContsIdDiv"+gubun).hide();
		$("#linkContsId"+gubun).val("0");
		$("#validationChkYn"+gubun).val("Y");
		$('#chkContsBtn'+gubun).attr("disabled", true);
		$('#drawContsBtn'+gubun).attr("disabled", false);
	}else{
		$("#linkContsId"+gubun).val("");
		$("#linkSubContsId"+gubun).val("");
		$('#linkContsIdDiv'+gubun).html(' <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" value=\"\"/>');
		$("#linkContsIdDiv"+gubun).show();
		$("#linkSubContsIdDiv"+gubun).hide();
		$("#validationChkYn"+gubun).val("N");
		$('#chkContsBtn'+gubun).attr("disabled", false);
		$('#drawContsBtn'+gubun).attr("disabled", true);
	}
	$("#contsInfo"+gubun).empty();
}
function fn_link_type_sel(gubun){

	var linkTypeSelelect = $('#linkTypeSelect'+gubun).val();
	if(linkTypeSelelect == "DETAIL"){

		$('#linkContsTypeCode'+gubun).empty();
		$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.detail);

		$('#linkContsIdDiv'+gubun).html(' <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" value=\"\"/>');
		$("#linkContsIdDiv"+gubun).show();
		$("#linkContsId"+gubun).val("");
		$("#linkContsTypeCode"+gubun).val("N10006");
		$("#linkSubContsIdDiv"+gubun).hide();
		$("#validationChkYn"+gubun).val("N");
		$("#contsInfo"+gubun).empty();
		$('#chkContsBtn'+gubun).attr("disabled", false);
		$('#drawContsBtn'+gubun).attr("disabled", true);
	}else if(linkTypeSelelect=="MENU"){

		$('#linkContsTypeCode'+gubun).empty();
		$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.menu);

		$("#linkContsTypeCode"+gubun).val("RADIOMAIN");
		$("#linkSubContsIdDiv"+gubun).hide();
		$("#linkContsIdDiv"+gubun).hide();
		$("#linkContsId"+gubun).val("0");
		$("#validationChkYn"+gubun).val("Y");
		$("#contsInfo"+gubun).empty();
		$('#chkContsBtn'+gubun).attr("disabled", true);
		$('#drawContsBtn'+gubun).attr("disabled", false);
/*	}else if(linkTypeSelelect=="AZTALK"){

		$('#linkContsTypeCode'+gubun).empty();
		$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.aztalk);

		$("#linkContsTypeCode"+gubun).val("AZTALK_A");
		$("#linkSubContsIdDiv"+gubun).hide();
		$('#linkContsIdDiv'+gubun).html(' <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" value=\"\"/>');
		$("#linkContsIdDiv"+gubun).show();
		$("#linkContsId"+gubun).val("");
		$("#validationChkYn"+gubun).val("N");
		$("#contsInfo"+gubun).empty();
		$('#chkContsBtn'+gubun).attr("disabled", false);
		$('#drawContsBtn'+gubun).attr("disabled", true);
	}else if(linkTypeSelelect=="SHOWING"){

		$('#linkContsTypeCode'+gubun).empty();
		$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.showing);

		$("#linkContsTypeCode"+gubun).val("SHOWINGHOME");
		$("#linkSubContsIdDiv"+gubun).hide();
		$('#linkContsIdDiv'+gubun).hide();
		$("#linkContsId"+gubun).val("0");
		$("#validationChkYn"+gubun).val("Y");
		$("#contsInfo"+gubun).empty();
		$('#chkContsBtn'+gubun).attr("disabled", true);
		$('#drawContsBtn'+gubun).attr("disabled", false);
*/	}
}
	// 랜딩 컨텐츠 유효성검사 - ???
	function fn_chk_conts(gubun){
		var linkContsTypeCode = $("select[name='linkContsTypeCode"+gubun+"']").val();
		var linkContsId = $("#linkContsId"+gubun).val();
		var linkSubContsId = $("#linkSubContsId"+gubun).val();
		if( linkContsId == ""){
			alert("컨텐츠ID를 입력해주세요.");
			return;
		}
		$.ajax({
			async:false,
			url: '/padm/event/web/eventcontents_informConts.json',
			type: "POST",
			data  : {
				contsId : linkContsId,
				subContsId : linkSubContsId,
				isValidationCheck : "Y",
				contsTypeCode : linkContsTypeCode
				},
			dataType:'json',
			success: function(data) {
				if(data.errMsg != '') {
					alert(data.errMsg);
					return;
				}
				if(data.isValidation == true) {
					alert("유효한 컨텐츠ID입니다.");
					$("#validationChkYn"+gubun).val('Y');
					$('#chkContsBtn'+gubun).attr("disabled", true);
					$('#drawContsBtn'+gubun).attr("disabled", false);
					if(linkContsTypeCode=="AZTALK_A"){
						$("#linkContsTypeCode"+gubun).val("AZTALK_C");
						$("#linkContsId"+gubun).val(data.informRanding.CHNLSEQ);
					}
				}else{
					alert("유효하지 않은 컨텐츠ID입니다.");
					$("#validationChkYn"+gubun).val('N');
					$('#chkContsBtn'+gubun).attr("disabled", false);
					$('#drawContsBtn'+gubun).attr("disabled", true);
				}
			},
	   		error: function() {
				alert("조회 실패");
				return;
			}
		});
	}

	function fn_draw_cont(gubun){
		var linkContsTypeCode = $("select[name='linkContsTypeCode"+gubun+"']").val();
		var linkContsId = $("#linkContsId"+gubun).val();
		var linkSubContsId = $("#linkSubContsId"+gubun).val();
		if (linkContsTypeCode == "") {
			alert("컨텐츠 타입코드를 선택해주세요.");
			return false;
		}
		if (linkContsId == "") {
			alert("컨텐츠ID를 입력해주세요.");
			return false;
		}
		if ($("#validationChkYn"+gubun).val() == 'N') {
			alert('유효성 검사를 해주세요.');
			return false;
		}

		radingPageContentsDp(linkContsId, linkContsTypeCode, linkSubContsId, gubun);
	}

	function radingPageContentsDp(linkContsId, linkContsTypeCode, linkSubContsId, gubun){

		$('#linkContsId'+gubun).data('tmpval', linkContsId);
		$('#linkSubContsId'+gubun).data('tmpval', linkSubContsId);

		$.ajax({
			async:false,
			url: '/padm/event/web/eventcontents_informConts.json',
			type: "POST",
			data  : {
				contsId : linkContsId,
				subContsId : linkSubContsId,
				isValidationCheck : "N",
				contsTypeCode : linkContsTypeCode
				},
			dataType:'json',
			success: function(data) {
				if(data.informRanding == "") {
					alert("[알림] 해당 컨텐츠 정보가 없습니다.");
					$("#constId"+gubun).focus();
				} else {
					var drawHTML = "";
					//아티스트
					if( data.informRanding ){
						if( linkContsTypeCode == 'N10006' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='3'><img width='100' height='100' src=\"http://image.melon.co.kr" + data.informRanding.CROP_IMG_PATH+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.ARTIST_ID+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.ARTIST_NAME_WEB_LIST+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.NATIONALITY_NAME+"/"+data.informRanding.SEX+"/"+data.informRanding.ACT_TYPE_NAME+"</td>"
								+	"</tr>"
								+	"</table>";
						//앨범
						}else if( linkContsTypeCode == 'N10002' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='4'><img width='100' height='100' src=\"http://image.melon.co.kr" + data.informRanding.ALBUM_IMG_PATH+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.ALBUM_ID+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.ALBUM_NAME_WEB_LIST+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.REP_ARTIST_NAME_BASKET+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.ISSUE_DATE+"</td>"
								+	"</tr>"
								+	"</table>";
						//곡명
						}else if( linkContsTypeCode == 'N10001' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='3'><img width='100' height='100' src=\"http://image.melon.co.kr" + data.informRanding.MV_IMG_PATH+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.SONGID+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.SONGNAMEWEBLIST+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.ARTISTNAMEBASKET+"</td>"
								+	"</tr>"
								+	"</table>";
						//영상
						}else if( linkContsTypeCode == 'N10003' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='3'><img width='100' height='100' src=\"http://image.melon.co.kr" + data.informRanding.MV_IMG_PATH+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.MV_ID+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.MV_TITLE+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.ATIST_NAME_BASKET+"</td>"
								+	"</tr>"
								+	"</table>";
						//아티스트플레이리스트	OR DJ플레이리스트
						}else if( linkContsTypeCode == 'N10016' || linkContsTypeCode == 'N10009' || linkContsTypeCode == 'N10005' ){
							var plyListImgPath =  "";
							if (data.informRanding.REPNT_IMAGE_PATH != null){
								plyListImgPath = data.informRanding.REPNT_IMAGE_PATH;
							}else{
								plyListImgPath = data.informRanding.ALBUM_IMAGE1_PATH;
							}
							var artistName =  "";
							if (linkContsTypeCode ==  'N10016'){
								artistName = data.informRanding.ARTIST_NAME_WEB_LIST;
							}else{
								artistName = data.informRanding.MEMBER_NICKNAME;
							}
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='4'><img width='100' height='100' src=\"http://image.melon.co.kr"+plyListImgPath+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.PLYLST_SEQ+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+artistName+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.SONG_CNT+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.OPEN_YN+"</td>"
								+	"</tr>"
								+	"</table>";
						//TV테마
						}else if( linkContsTypeCode == 'N10017' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='390px' />"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.PROG_SEQ+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.PROG_NAME+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.MV_CNT+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.DISP_YN+"</td>"
								+	"</tr>"
								+	"</table>";
						//멤버키
						}else if( linkContsTypeCode == 'N10018' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' />"
								+	"<tr>"
								+		"<td rowspan='4'><img width='100' height='100' src=\"" + data.informRanding.MYPAGE_IMG+ "\"/></td>"
								+		"<td style='text-align:left;'>"+data.informRanding.MEMBER_KEY+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.MEMBER_NICKNAME+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>"+data.informRanding.GNR1_CODE+"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td style='text-align:left;'>플레이리스트 수 "+data.informRanding.PLYLST_TOTAL_CNT+"개</td>"
								+	"</tr>"
								+	"</table>";
						//멜론라디오 채널 상세
						}else if( linkContsTypeCode == 'N10025' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='300px' />"
								+		"<tr><td style='text-align:left;'> 대채널ID : "+data.informRanding.CHNLLSEQ+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 대채널명 : "+data.informRanding.CHNLLTITLE+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 대채널서비스여부: "+data.informRanding.CHNLLSVCYN+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 대채널삭제여부 : "+data.informRanding.CHNLLDELYN+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 소채널ID : "+data.informRanding.CHNLLSEQ+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 소채널명 : "+data.informRanding.CHNLSTITLE+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 소채널서비스여부: "+data.informRanding.CHNLSSVCYN+"</td></tr>"
								+		"<tr><td style='text-align:left;'> 소채널삭제여부 : "+data.informRanding.CHNLSDELYN+"</td></tr>"
								+	"</table>";
						//멜론라디오 메인
						}else if( linkContsTypeCode == 'RADIOMAIN' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='300px' />"
								+	"<tr><td style='text-align:left;'> 메뉴 : 멜론라디오</td></tr>"
								+	"<tr><td style='text-align:left;'> 랜딩 : 메인</td></tr>";
								+	"</table>";
						//멜론라디오 대채널 상세
						}else if( linkContsTypeCode == 'RADIOTOPMENU' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='300px' />"
								+	"<tr><td style='text-align:left;'> 메뉴 : 멜론라디오</td></tr>"
								+	"<tr><td style='text-align:left;'> 대채널ID : "+data.informRanding.CHNLLSEQ+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 대채널명 : "+data.informRanding.CHNLLTITLE+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 대채널서비스여부: "+data.informRanding.CHNLLSVCYN+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 대채널삭제여부 : "+data.informRanding.CHNLLDELYN+"</td></tr>"
								+	"</table>";
						//아지톡 메인
/*						}else if( linkContsTypeCode == 'AZTALK_H' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='300px' />"
								+	"<tr><td style='text-align:left;'> 메뉴 : 아지톡 </td></tr>"
								+	"<tr><td style='text-align:left;'> 랜딩 : 메인</td></tr>";
								+	"</table>";
						//아지톡 채널 상세
						}else if( linkContsTypeCode == 'AZTALK_A'|| linkContsTypeCode == 'AZTALK_C' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' /><tr>"
								+		"<td rowspan='3'><img width='100' height='100' src=\"http://image.melon.co.kr/" + data.informRanding.IMGURL+ "\"/></td>"
								+		"<td style='text-align:left;'> 채널명 : "+data.informRanding.CHNLTITLE+"</td>"
								+	"</tr>"
								+	"<tr><td style='text-align:left;'> 채널ID : "+data.informRanding.CHNLSEQ+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 아티스트ID : "+data.informRanding.ATISTID+"</td></tr>"
								+	"</table>";
						//아지톡 토픽 상세
						}else if( linkContsTypeCode == 'N10026' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='300px' /><tr>"
								+		"<td rowspan='6'><img width='100' height='100' src=\"" + data.informRanding.THUMBURL+ "\"/></td>"
								+		"<td style='text-align:left;'> 채널명 : "+data.informRanding.CHNLTITLE+"</td>"
								+	"</tr>"
								+	"<tr><td style='text-align:left;'> 채널ID : "+data.informRanding.CHNLSEQ+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 아티스트ID : "+data.informRanding.ATISTID+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 토픽ID : "+data.informRanding.TOPICSEQ+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 토픽내용 : "+data.informRanding.TOPICCONT+"</td></tr>"
								+	"<tr><td style='text-align:left;'> 토픽타입 : "+data.informRanding.TOPICTYPE+"</td></tr>"
								+	"</table>";
						//테마 상세
*/						}else if( linkContsTypeCode == 'N10027' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
									+ 	"<col width='90px' /><col width='300px' /><tr>"
									+		"<td rowspan='6'><img width='100' height='100' src=\"http://image.melon.co.kr/" + data.informRanding.THEME_IMAGE_PATH+ "\"/></td>"
									+		"<td style='text-align:left;'> 테마명 : "+data.informRanding.THEME_TITLE+"</td>"
									+	"</tr>"
									+	"</table>";

							var title = data.informRanding.THEME_TITLE;
							var titleLength =  (function(s,b,i,c){
								for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
								return b;
							})(title);

							if(titleLength > 200) {
								title = title.substring(0, 50);
							}

							$('#banerTitle'+gubun).val(title);
						//멜론쇼윙 홈
/*						}else if( linkContsTypeCode == 'SHOWINGHOME' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='300px' />"
								+	"<tr><td style='text-align:left;'> 메뉴 : 멜론쇼윙 </td></tr>"
								+	"<tr><td style='text-align:left;'> 랜딩 : 메인</td></tr>";
						//쇼잉 상세
						}else if( linkContsTypeCode == 'N10028' ){
							drawHTML = "<table bgcolor='#d3d3d3'>"
								+ 	"<col width='90px' /><col width='400px' /><tr>"
								+		"<td rowspan='6'><img width='100' height='100' src=\"" + data.informRanding.THUMB_URL+ "\"/></td>"
								+		"<td style='text-align:left;'> 쇼윙ID : "+data.informRanding.CONTSID+"</td>"
								+	"</tr>"
								+	"<tr><td style='text-align:left;'> title : "+data.informRanding.TITLE+"</td></tr>"
								+	"<tr><td style='text-align:left;'> nickname : "+data.informRanding.NICKNAME+"</td></tr>"
								+	"<tr><td style='text-align:left;'> created_at : "+data.informRanding.CREATED_AT+"</td></tr>"
								+	"<tr><td style='text-align:left;'> sharing_url : <a href='"+data.informRanding.SHARING_URL+"' target='_blank'>"+data.informRanding.SHARING_URL+"</a></td></tr>"
								+	"<tr><td style='text-align:left;'> sharing_msg : "+data.informRanding.SHARING_MSG+"</td></tr>"
								+	"</table>";
*/						}
					}

					$("#contsInfo"+gubun).empty();
					$("#contsInfo"+gubun).append(drawHTML);
					$('#chkContsBtn'+gubun).attr("disabled", false);
					$('#drawContsBtn'+gubun).attr("disabled", true);
					bindContsInput(gubun);
				}
			},
	   		error: function() {
				alert("조회 실패");
				return;
			}
		});
	}


String.prototype.replaceAll = function(rgExp, replaceText){
	var strOriginal = this;
	while(strOriginal.indexOf(rgExp)>-1)
		strOriginal = strOriginal.replace(rgExp, replaceText);
	return strOriginal;
};

function bindContsInput(gubun) {
	$('#linkContsId'+gubun+', #linkSubContsId'+gubun).keyup(function() {
		var tmpval = $(this).data('tmpval') || '';
		var thisval = $(this).val() || '';
		if(tmpval != thisval) {
			$('#contsInfo'+gubun).empty();
			$("#validationChkYn"+gubun).val("N");
			//$('#chkContsBtn'+gubun).attr("disabled", true);
			$('#drawContsBtn'+gubun).attr("disabled", false);
		}
	});
}

function landingValidationCheck(gubun, dpYn) {
	var linkTypeGubun = $(':radio[name="linkTypeGubun'+gubun+'"]:checked').val();
	var gubunName = "";
	if(gubun == "Ua"){
		gubunName = "Android ";
	}else if(gubun == "Ui"){
		gubunName = "iOS ";
	}else if(gubun == "Pa"){
		gubunName = "포스터 Android ";
	}else if(gubun == "Pi"){
		gubunName = "포스터 iOS ";
	}else if(gubun == "La"){
		gubunName = "외부이동링크 Android ";
	}else if(gubun == "Li"){
		gubunName = "외부이동링크 iOS ";
	}

	if(linkTypeGubun == 'MA') {
		var linkContsTypeCode = $("select[name='linkContsTypeCode"+gubun+"']").val();
		var linkContsId = $("#linkContsId"+gubun).val();
		//var linkSubContsId = $("#linkSubContsId"+gubun).val();

		if (linkContsTypeCode == "") {
			alert(gubunName+"컨텐츠 타입코드를 선택해주세요.");
			return false;
		}
		if (linkContsId == "") {
			alert(gubunName+"컨텐츠ID를 입력해주세요.");
			return false;
		}
		if ($("#validationChkYn"+gubun).val() == 'N') {
			alert(gubunName+'유효성 검사를 해주세요.');
			return false;
		}
		if($('#drawContsBtn'+gubun).attr("disabled") == false) {
			alert(gubunName+'적용 버튼을 클릭해주세요.');
			return false;
		}
	}else{
		if($.trim($('#linkUrl'+gubun).val()) == '' && dpYn == "Y" && linkTypeGubun != 'AA') {
			alert(gubunName+"링크주소를 입력 하세요.");
			return false;
		}
		if($.trim($('#linkUrl'+gubun).val()) != '' && dpYn == "Y" && linkTypeGubun != 'AA') {
			if(($.trim($('#linkUrl'+gubun).val())).substring(0, 4) != "http"){
				alert("URL 입력시 http://를 포함하여 입력하여 주십시오.");
				return false;
			}
		}
	}
	return true;
}

function linkAreaSetting(linkGubun, linkUrl, linkContsType, linkSubContsId, linkContsId, gubun){

	if(linkGubun=="PA"){
		$("input[name=linkTypeGubun"+gubun+"][value=PA]").attr("checked","checked");
		$("#linkUrl"+gubun).show();
		$("#consInfo"+gubun).hide();
		$("#contsInfo"+gubun).empty();
		$("#linkUrl"+gubun).val(linkUrl);
	}else if(linkGubun=="OA"){
		$("input[name=linkTypeGubun"+gubun+"][value=OA]").attr("checked","checked");
		$("#linkUrl"+gubun).show();
		$("#consInfo"+gubun).hide();
		$("#contsInfo"+gubun).empty();
		$("#linkUrl"+gubun).val(linkUrl);
	}else if(linkGubun=="AA"){
		$("input[name=linkTypeGubun"+gubun+"][value=AA]").attr("checked","checked");
		$("#linkUrl"+gubun).show();
		$("#consInfo"+gubun).hide();
		$("#contsInfo"+gubun).empty();
		$("#linkUrl"+gubun).val(linkUrl);
	}else if(linkGubun=="MA"){
		$("input[name=linkTypeGubun"+gubun+"][value=MA]").attr("checked","checked");
		$("#linkUrl"+gubun).hide();
		$("#linkUrl"+gubun).val("");
		$("#consInfo"+gubun).show();

		if(linkContsType=='N10025' || linkContsType=='N10026'){
			if(linkContsType=='N10026'){
				$('#linkContsIdDiv'+gubun).html('AZtalk 토픽 ID : <input type=\"text\" name=\"linkContsId\" id=\"linkContsId\" value=\"\"/>');
				$('#linkSubContsIdDiv'+gubun).html('AZtalk 채널ID : <input type=\"text\" name=\"linkSubContsId\" id=\"linkSubContsId\" value=\"\"/>');
			}else{
				$('#linkContsIdDiv'+gubun).html('소채널 ID : <input type=\"text\" name=\"linkContsId\" id=\"linkContsId\" value=\"\"/>');
				$('#linkSubContsIdDiv'+gubun).html('멜론라디오 대채널ID : <input type=\"text\" name=\"linkSubContsId\" id=\"linkSubContsId\" value=\"\"/>');
			}
			$("#linkSubContsIdDiv"+gubun).show();
			$("#linkSubContsId"+gubun).val(linkSubContsId);
		}

		if(linkContsType=="N10025"){
			if(linkContsId=="0" || linkContsId==0){
				linkContsType="RADIOMAIN";
			}else if(linkSubContsId==null || linkSubContsId=="" || linkSubContsId == undefined){
				linkContsType="RADIOTOPMENU";
			}
		}

		if(linkContsType=="N10026"){
			if(linkContsId=="0" || linkContsId==0){
				linkContsType="AZTALK_H";
			}else if(linkSubContsId==null || linkSubContsId=="" || linkSubContsId == undefined){
				linkContsType="AZTALK_C";
			}
		}

		if(linkContsType=='RADIOMAIN'
				|| linkContsType=='RADIOTOPMENU'
				){
			$("#linkTypeSelect"+gubun).val("MENU");

			$('#linkContsTypeCode'+gubun).empty();
			$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.menu);

		}else if(linkContsType=='N10026'
				|| linkContsType=='AZTALK_H'
				|| linkContsType=='AZTALK_C'
				){
			$("#linkTypeSelect"+gubun).val("AZTALK");

			$('#linkContsTypeCode'+gubun).empty();
			$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.aztalk);
		}else if(linkContsType=="N10028"){
			$("#linkTypeSelect"+gubun).val("SHOWING");
			$('#linkContsTypeCode'+gubun).empty();
			$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.showing);
			if(linkContsId=="0" || linkContsId==0){
				linkContsType="SHOWINGHOME";
				$("#linkContsId"+gubun).hide();
			}
		}else{
			$("#linkTypeSelect"+gubun).val("DETAIL");

			$('#linkContsTypeCode'+gubun).empty();
			$('#linkContsTypeCode'+gubun).append(linkContsTypeOptionItems.detail);
		}

		if(linkContsType=='RADIOMAIN' || linkContsType=='AZTALK_H'){
			$("#linkContsIdDiv"+gubun).hide();
			$("#linkSubContsIdDiv"+gubun).hide();
		}else if(linkContsType=='RADIOTOPMENU' || linkContsType=='AZTALK_C'){
			$('#linkContsIdDiv'+gubun).html(' <input type=\"text\" name=\"linkContsId'+gubun+'\" id=\"linkContsId'+gubun+'\" value=\"\"/>');
			$("#linkSubContsIdDiv"+gubun).hide();
		}

		$("#linkContsTypeCode"+gubun).val(linkContsType);
		$("#linkContsId"+gubun).val(linkContsId);

		radingPageContentsDp(linkContsId, linkContsType, linkSubContsId, gubun);
	}
}
// 입력 폼 값에 숫자만 쓰여 졌는지 체크
function numCheck( inputValue ){

    var val = inputValue;
    for( var i = 0; i < val.length; i++ ) {
        inputValue = val.charCodeAt(i);

        if( !( 0x30 <= inputValue && inputValue <= 0x39 ) ) {
            alert( "숫자만 입력 하세요." );
            return;
        }
    }
}

function fn_url_type(type) {

//    if( $('#webDpYn').is(':checked')||$('#mobileDpYn').is(':checked')
//    		|| $('#androidDpYn').is(':checked')
//    		|| $('#iosDpYn').is(':checked')|| $('#iosxDpYn').is(':checked')) { //4채널중 1개라도 선택시 배너 이미지 입력
//        $('#bannerImg').prop('disabled', false);
//    }else{
//   	 $('#bannerImg').prop('disabled', true);
//    }

    if (type == 'W') {
        if( $('#webDpYn').is(':checked') ) {
            $('#url').prop('disabled', false);
            $('#wimg').prop('disabled', false);
            //$('#wCmtDsplyYn').prop('disabled', false);
            //$('#wEntDsplyYn').prop('disabled', false);
            wDp = "Y"; //웹 url입력체크
        } else {
            $('#url').prop('disabled', true);
            $('#wimg').prop('disabled', true);
            //$('#wCmtDsplyYn').prop('disabled', true);
            //$('#wEntDsplyYn').prop('disabled', true);
            wDp = "N";
        }
    } else if (type == 'M') {

        if($('#mobileDpYn').is(':checked')){
            $('#mobileUrl').prop('disabled', false);
            $('#posterMcomUrl').prop('disabled', false);
            $('#outMcomUrl').prop('disabled', false);
        	mDp = "Y"; //mcom url입력체크
        }else{
        	$('#mobileUrl').prop('disabled', true);
        	$('#posterMcomUrl').prop('disabled', true);
        	$('#outMcomUrl').prop('disabled', true);
        	mDp = "N"; //mcom url입력체크
        }

        if($('#androidDpYn').is(':checked')){
           $('#linkUrlLa').prop('disabled', false);
           $('#linkUrlPa').prop('disabled', false);
           $('#linkUrlUa').prop('disabled', false);
           aDp = "Y"; //android url입력체크
        }else{
        	$('#linkUrlLa').prop('disabled', true);
        	$('#linkUrlPa').prop('disabled', true);
        	$('#linkUrlUa').prop('disabled', true);
        	aDp = "N"; //android url입력체크
        }

        if($('#iosDpYn').is(':checked')){
            $('#linkUrlLi').prop('disabled', false);
            $('#linkUrlPi').prop('disabled', false);
            $('#linkUrlUi').prop('disabled', false);
        	iDp = "Y"; //ios url입력체크
        }else if($('#iosxDpYn').is(':checked')){
            $('#linkUrlLi').prop('disabled', true);
            $('#linkUrlPi').prop('disabled', true);
            $('#linkUrlUi').prop('disabled', true);
        	iDp = "Y"; //ios url입력체크
        }else{
        	$('#linkUrlLi').prop('disabled', true);
        	$('#linkUrlPi').prop('disabled', true);
        	$('#linkUrlUi').prop('disabled', true);
        	iDp = "N"; //ios url입력체크
        }

    } else if (type == 'F') { //미노출
    	if($('#dpFlag').is(':checked')){ //미노출 선택시

			wDp = "N"; //웹 url입력체크
			$("#webDpYn").prop("checked",false);
			$('#webDpYn').prop('disabled', true);
			$('#url').prop('disabled', true);

			mDp = "N"; //모바일 url입력체크
			$("#mobileDpYn").prop("checked",false);
			$('#mobileDpYn').prop('disabled', true);
			$('#mobileUrl').prop('disabled', true);
			$('#posterMcomUrl').prop('disabled', true);
			$('#outMcomUrl').prop('disabled', true);

			aDp = "N"; //안드로이드 url입력체크
			$("#androidDpYn").prop("checked",false);
			$('#androidDpYn').prop('disabled', true);
        	$('#linkUrlLa').prop('disabled', true);
        	$('#linkUrlPa').prop('disabled', true);
        	$('#linkUrlUa').prop('disabled', true);

			iDp = "N"; //ios url입력체크
			$("#iosDpYn").prop("checked",false);
			$("#iosxDpYn").prop("checked",false);
			$('#iosDpYn').prop('disabled', true);
			$('#iosxDpYn').prop('disabled', true);
			$('#linkUrlLi').prop('disabled', true);
        	$('#linkUrlPi').prop('disabled', true);
        	$('#linkUrlUi').prop('disabled', true);

        	$('#bannerImg').prop('disabled', true); //미노출시에만 배너 입력방지
		}else{ //미노출 선택삭제
			$('#webDpYn').prop('disabled', false);
	  		$('#mobileDpYn').prop('disabled', false);
	  		$('#androidDpYn').prop('disabled', false);
	 		$('#iosDpYn').prop('disabled', false);
	 		$('#iosxDpYn').prop('disabled', false);
	 		$('#bannerImg').prop('disabled', false); //미노출 해제시 배너 입력
     	 }
     }
}

function check_special_char(checkId)
{
	var specialchar2 = "><%=|\"\'\\";

	var search = $('#'+checkId).val();
	var len = search.length;

	for(var i=0; i < len; i++)
	{
		if(specialchar2.indexOf(search.substring(i, i + 1)) >= 0)
		{
			var targetChar = search.substring(i, i + 1);
			var msg = "특수문자 "+targetChar +" 은 입력할 수 없습니다.";
			alert(msg);
			$('#'+checkId).focus();
			return false;
		}
	}
	return true;
}

//앨범코드 유효성 체크
function checkAlbumCode(){
	var albumId = "";
    if (document.inputForm.albumId.value == "") {
        alert("앨범 코드를 입력해 주세요");
        document.inputForm.albumId.focus();
        return;
    } else {
    	albumId = document.inputForm.albumId.value;
        numCheck(albumId);

        // 앨범 코드 리스트
        var albumIdList = document.inputForm.albumIdList.value;

        var array = albumIdList.split(",");
        for( var i =0; i < array.length; i++ ){
            if( document.inputForm.albumId.value == array[i] ) {
                alert("이미 등록된 앨범 코드 입니다. ");
                document.inputForm.albumId.value = "";
                return;
            }
        }

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventAlbum.json',
            data: { albumId : albumId},
            success: function(data){
	    		if(data.albumIdChk == 'true'){
	   				$('#albumIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addAlbumCode()">');
	   			}else{
	   				$('#albumIdBox').html('유효하지 않은 코드입니다.');
	   			}
            }
        });
    }
}

function addAlbumCode(){
    // 앨범 코드 리스트
    var albumIdList = document.inputForm.albumIdList.value;
    var array = albumIdList.split(",");
    for( var i =0; i < array.length; i++ ){
        if( document.inputForm.albumId.value == array[i] ) {
            alert("이미 등록된 앨범 코드 입니다. ");
            document.inputForm.albumId.value = "";
            document.inputForm.addAlbumIdFlag.value= '';
            $('#albumIdBox').html('');
            return;
        } else {
       	 	document.inputForm.addAlbumIdFlag.value= 'Y';
        }
    }
    if(document.inputForm.addAlbumIdFlag.value == 'Y'){
		$('#albumIdListBox').html(albumIdList + document.inputForm.albumId.value+',');
		document.inputForm.albumIdList.value = albumIdList + document.inputForm.albumId.value+',';
		$('#albumIdBox').html('');
		document.inputForm.albumId.value = '';
		document.inputForm.addAlbumIdFlag.value = '';
    }

}
//앨범코드 삭제
function delAlbumCode(){
	$('#albumIdBox').html('');
	$('#albumIdListBox').html('');
    document.inputForm.albumId.value = '';
    document.inputForm.addAlbumIdFlag.value= '';
    document.inputForm.albumIdList.value = '';
}

//아티스트 코드 유효성 체크
function checkArtistCode(){
    if (document.inputForm.artistId.value == "") {
        alert("아티스트 아이디를 입력해 주세요");
        document.inputForm.artistId.focus();
        return;
    } else {
    	artistId = document.inputForm.artistId.value;
        numCheck(artistId);

        // 앨범 코드 리스트
        var artistIdList = document.inputForm.artistIdList.value;

        var array = artistIdList.split(",");
        for( var i =0; i < array.length; i++ ){
            if( document.inputForm.artistId.value == array[i] ) {
                alert("이미 등록된 아티스트 코드 입니다. ");
                document.inputForm.artistId.value = "";
                return;
            }
        }

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventArtist.json',
            data: { artistId : artistId},
            success: function(data){
    			if(data.artistIdChk == 'true'){
    				$('#artistIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addArtistCode()">');
	   			}else{
	   				$('#artistIdBox').html('유효하지 않은 코드입니다.');
	   			}
            }
        });
    }
}

function addArtistCode(){
    // 아티스트 코드 리스트
    var artistIdList = document.inputForm.artistIdList.value;
    var array = artistIdList.split(",");
    for( var i =0; i < array.length; i++ ){
        if( document.inputForm.artistId.value == array[i] ) {
            alert("이미 등록된 아티스트 코드 입니다. ");
            document.inputForm.artistId.value = "";
            document.inputForm.addArtistIdFlag.value= '';
            $('#artistIdBox').html('');
            return;
        } else {
            document.inputForm.addArtistIdFlag.value= 'Y';
        }
    }

    if(document.inputForm.addArtistIdFlag.value == 'Y'){
		$('#artistIdListBox').html(artistIdList + document.inputForm.artistId.value+',');
		document.inputForm.artistIdList.value = artistIdList + document.inputForm.artistId.value+',';
		$('#artistIdBox').html('');
		document.inputForm.artistId.value = '';
		document.inputForm.addArtistIdFlag.value = '';
    }
}
//아티스트 코드 삭제
function delArtistCode(){
	$('#artistIdListBox').html('');
	document.inputForm.artistId.value = '';
	document.inputForm.addArtistIdFlag.value= '';
	document.inputForm.artistIdList.value = '';
}

//영상 유효성 체크
function checkMvCode(){
	var mvId = "";
    if (document.inputForm.mvId.value == "") {
        alert("영상 아이디를 입력해주세요");
        document.inputForm.mvId.focus();
        return;
    } else {
		mvId = document.inputForm.mvId.value;
		numCheck(mvId);

        // 영상 코드 리스트
        var mvIdList = document.inputForm.mvIdList.value;

        var array = mvIdList.split(",");
        for( var i =0; i < array.length; i++ ){
            if( document.inputForm.mvId.value == array[i] ) {
                alert("이미 등록된 영상 코드 입니다. ");
                document.inputForm.mvId.value = "";
                return;
            }
        }

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventMv.json',
            data: { mvId : mvId},
            success: function(data){
    			if(data.mvIdChk == 'true'){
   				$('#mvIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addMvCode()">');
	   			}else{
	   				$('#mvIdBox').html('유효하지 않은 코드입니다.');
	   			}
            }
        });
    }
}

function addMvCode(){
    // 영상 리스트
    var mvIdList = document.inputForm.mvIdList.value;
    var array = mvIdList.split(",");
    for( var i =0; i < array.length; i++ ){
        if( document.inputForm.mvId.value == array[i] ) {
            alert("이미 등록된 영상 코드 입니다. ");
            document.inputForm.mvId.value = "";
            document.inputForm.addMvIdFlag.value= '';
            $('#mvIdBox').html('');
            return;
        } else {
       	 document.inputForm.addMvIdFlag.value= 'Y';
        }
    }
    if(document.inputForm.addMvIdFlag.value == 'Y'){
  	   	$('#mvIdListBox').html(mvIdList + document.inputForm.mvId.value+',');
  	    document.inputForm.mvIdList.value = mvIdList + document.inputForm.mvId.value+',';
  		$('#mvIdBox').html('');
  	    document.inputForm.mvId.value = '';
  	    document.inputForm.addMvIdFlag.value = '';
    }

}
//영상 삭제
function delMvCode(){
	$('#mvIdBox').html('');
	$('#mvIdListBox').html('');
	document.inputForm.mvId.value = '';
	document.inputForm.addMvIdFlag.value= '';
	document.inputForm.mvIdList.value = '';
}

//곡코드 유효성 체크
function checkSongCode(){
	var songId = "";
    if (document.inputForm.songId.value == "") {
        alert("곡 코드를 입력해 주세요");
        document.inputForm.songId.focus();
        return;
    } else {
    	songId = document.inputForm.songId.value;
        numCheck(songId);

        // 곡 코드 리스트
        var songIdList = document.inputForm.songIdList.value;

        var array = songIdList.split(",");
        for( var i =0; i < array.length; i++ ){
            if( document.inputForm.songId.value == array[i] ) {
                alert("이미 등록된 곡 코드 입니다. ");
                document.inputForm.songId.value = "";
                return;
            }
        }

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventSong.json',
            data: { songId : songId},
            success: function(data){
	    		if(data.songIdChk == 'true'){
	   				$('#songIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addSongCode()">');
	   			}else{
	   				$('#songIdBox').html('유효하지 않은 코드입니다.');
	   			}
            }
        });
    }
}

function addSongCode(){
    // 곡 코드 리스트
    var songIdList = document.inputForm.songIdList.value;
    var array = songIdList.split(",");
    for( var i =0; i < array.length; i++ ){
        if( document.inputForm.songId.value == array[i] ) {
            alert("이미 등록된 곡 코드 입니다. ");
            document.inputForm.songId.value = "";
            document.inputForm.addSongIdFlag.value= '';
            $('#songIdBox').html('');
            return;
        } else {
       	 	document.inputForm.addSongIdFlag.value= 'Y';
        }
    }
    if(document.inputForm.addSongIdFlag.value == 'Y'){
		$('#songIdListBox').html(songIdList + document.inputForm.songId.value+',');
		document.inputForm.songIdList.value = songIdList + document.inputForm.songId.value+',';
		$('#songIdBox').html('');
		document.inputForm.songId.value = '';
		document.inputForm.addSongIdFlag.value = '';
    }

}
//곡코드 삭제
function delSongCode(){
	$('#songIdBox').html('');
	$('#songIdListBox').html('');
    document.inputForm.songId.value = '';
    document.inputForm.addSongIdFlag.value= '';
    document.inputForm.songIdList.value = '';
}

//스토리 코드 유효성 체크
function checkStoryCode(){
    if (document.inputForm.storySeq.value == "") {
        alert("스토리 시퀀스를 입력해 주세요");
        document.inputForm.storySeq.focus();
        return;
    } else {
    	var storySeq = document.inputForm.storySeq.value;
        numCheck(storySeq);

        // 스토리 코드 리스트
        var storySeqList = document.inputForm.storySeqList.value;
        if(storySeqList.indexOf(",") >= 0){
        	alert('스토리 코드는 하나만 등록가능합니다.');
        	$('#storySeq').val('');
        	return;
        }
       // var array = storySeqList.split(",");
        //for( var i =0; i < array.length; i++ ){
        //    if( document.inputForm.storySeq.value == array[i] ) {
        //        alert("이미 등록된 스토리 코드 입니다. ");
        //        document.inputForm.storySeq.value = "";
        //        return;
        //    }
        //}

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventStory.json',
            data: { storySeq : storySeq},
            success: function(data){
    			if(data.storySeqChk == 'true'){
    				$('#storySeqBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addStoryCode()">');
	   			}else{
	   				$('#storySeqBox').html('유효하지 않은 코드입니다.');
	   			}
            }
        });
    }
}

function addStoryCode(){
    // 스토리 코드 리스트
    var storySeqList = document.inputForm.storySeqList.value;
    
    if(storySeqList.indexOf(",")>= 0){
    	alert('스토리 코드는 하나만 등록가능합니다.');
    	$('#storySeq').val('');
    	return;
    }else{
    	document.inputForm.addStorySeqFlag.value= 'Y';
    }
    var array = storySeqList.split(",");
    //for( var i =0; i < array.length; i++ ){
    //    if( document.inputForm.storySeq.value == array[i] ) {
    //        alert("이미 등록된 스토리 코드 입니다. ");
    //        document.inputForm.storySeq.value = "";
    //        document.inputForm.addStorySeqFlag.value= '';
    //        $('#storySeqBox').html('');
    //        return;
    //    } else {
    //        document.inputForm.addStorySeqFlag.value= 'Y';
    //    }
    //}

    if(document.inputForm.addStorySeqFlag.value == 'Y'){
		$('#storySeqListBox').html(storySeqList + document.inputForm.storySeq.value+',');
		document.inputForm.storySeqList.value = storySeqList + document.inputForm.storySeq.value+',';
		$('#storySeqBox').html('');
		document.inputForm.storySeq.value = '';
		document.inputForm.addStorySeqFlag.value = '';
    }
}
//스토리 코드 삭제
function delStoryCode(){
	$('#storySeqListBox').html('');
	document.inputForm.storySeq.value = '';
	document.inputForm.addStorySeqFlag.value= '';
	$('#storySeqList').val('');
}

//업체속성값 유효성 체크
function checkBpNoticeId(){

    if (document.inputForm.bpNoticeId.value == "") {
        alert("업체속성값을 입력해 주세요");
        document.inputForm.bpNoticeId.focus();
        return;
    } else {
   	 var bpNoticeId = document.inputForm.bpNoticeId.value;
        numCheck( bpNoticeId );

        $.ajax({
            async: false,
            url: '/padm/event/web/eventmanagement_informEventBpNotice.json',
            data: { bpNoticeId : bpNoticeId},
            success: function(data){
    			if(data.bpNoticeIdChk == 'true'){
   				$('#bpNoticeIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addBpNoticeCode()">');
   			}else{
   				$('#bpNoticeIdBox').html('유효하지 않은 코드입니다.');
   			}

            }
        });
    }
}

//업체속성값 추가
function addBpNoticeCode() {
    // 업체속성값 리스트
    var bpNoticeIdList = document.inputForm.bpNoticeIdList.value;

    var array = bpNoticeIdList.split(",");
    for ( var i = 0; i < array.length; i++) {
        if (document.inputForm.bpNoticeId.value == array[i]) {
            alert("이미 등록된 업체속성값 입니다. ");
            document.inputForm.bpNoticeId.value = "";
            document.inputForm.addBpNoticeIdFlag.value = '';
            $('#bpNoticeIdBox').html('');
            return;
        } else {
            document.inputForm.addBpNoticeIdFlag.value = 'Y';
        }
    }

    if(document.inputForm.addBpNoticeIdFlag.value == 'Y'){
		$('#bpNoticeIdListBox').html(bpNoticeIdList+document.inputForm.bpNoticeId.value+',');
		document.inputForm.bpNoticeIdList.value = bpNoticeIdList+document.inputForm.bpNoticeId.value+',';
		$('#bpNoticeIdBox').html('');
		document.inputForm.bpNoticeId.value = '';
		document.inputForm.addBpNoticeIdFlag.value = '';
    }
}

//업체속성값 삭제
function delBpNoticeIdCode() {
	$('#bpNoticeIdListBox').html('');
	document.inputForm.bpNoticeId.value = '';
	document.inputForm.addBpNoticeIdFlag.value= '';
	document.inputForm.bpNoticeIdList.value = '';
}

function getPrtEventId() {
	 var prtEventId = $('#prtEventId').val();
   if ( prtEventId == '' ) { alert('이벤트 코드를 입력하세요.'); return; }

   $.ajax({
       async: false,
       url: '/padm/event/web/eventmanagement_informPrtEventId.json',
       data: { prtEventId : prtEventId},
       success: function(data){
			if(data.prtEventIdChk == 'true'){
				$('#prtEventIdBox').html('유효한 코드입니다.');
			}else{
				$('#prtEventIdBox').html('유효하지 않은 코드입니다.');
			}
       }
   });
}

function prtEventIdCheck() {
    var c = $('#parentIdChk').is(":checked");
    if (c) {
        $('#prtEventId').removeAttr("disabled");
        $('#prtEventId').focus();
    } else {
        $('#prtEventId').attr("disabled", "disabled");
        $('#prtEventId').val('');
    }
}

function checkPromoId(){
	 var promoId = $('#promoId').val();
    if ( promoId == '' ) { alert('프로모션 ID를 입력하세요.'); return; }

    $.ajax({
        async: false,
        url: '/padm/event/web/eventmanagement_informPromoId.json',
        data: { promoId : promoId},
        success: function(data){
			if(data.promoIdChk == 'true'){
				$('#promoIdBox').html('유효한 코드입니다. <input type="button" value="추가" onclick="javascript:addPromoId()">');
			}else{
				$('#promoIdBox').html('유효하지 않은 코드입니다.');
			}
        }
    });
}

//프로모션ID 추가
function addPromoId() {
	$('#promoIdListBox').html(document.inputForm.promoId.value);
	document.inputForm.promoIdList.value = document.inputForm.promoId.value;
	$('#promoIdBox').html('');
	document.inputForm.promoId.value = '';
}

//프로모션ID 삭제
function delPromoId() {
	$('#promoIdListBox').html('');
	document.inputForm.promoId.value = '';
	document.inputForm.promoIdList.value = '';
}

function insGift(cntName, giftName) {
	var insCount = $('#'+cntName).val();
	var len = parseInt(insCount)+1;

	$('#'+giftName+'1').hide();
	$('#'+giftName+'2').hide();
	$('#'+giftName+'3').hide();
	$('#'+giftName+'4').hide();

	if(insCount > 0){
		for(var i=1; i < len; i++) {
			$('#'+giftName+i).show();
		}
	}
}

function insView(viewId) {
	$('#'+viewId).show();
}

// Byte 계산.
function byteCntFunc(textId, textByte){
	var checkText = $("#"+textId ).val();
	var byteCnt = 0;
	for(var idx=0; idx < checkText.length; idx++){
		var charAt = checkText.charAt(idx);
		byteCnt = checkText.charCodeAt(idx) > 128 ? byteCnt+2 : byteCnt+1;
	}

	if(textByte<byteCnt) {
		return false;
	}

	return true;
}

//========== 백그라운드 컬러 세팅 부분 =============================/
//mobile
function selMobBgColor(){
	var finalSelectedColor = $('#bgColorName').val();
	if(finalSelectedColor==''){
		alert('백그라운드 컬러를 선택하지 않으셨습니다.');
		$('#bgColorInputCheck').val('N');
	}else if(finalSelectedColor.length!=7){
		alert('백그라운드 컬러가 잘못 선택되었습니다.');
		$('#bgColorInputCheck').val('N');
	}else{
		$('#viewBgColor').css('background-color',finalSelectedColor);
		$('#bgColorName').attr('readOnly',true);
		$('#bgColorName').val(finalSelectedColor);
		$('#bgColor').val(finalSelectedColor);
		$('#bgColorInputCheck').val('Y');
	}
}

function delMobBgColor(){
	var finalSelectedColor = '';
	$('#viewBgColor').removeAttr('style');
	$('#bgColorName').attr('readOnly',false);
	$('#bgColorName').val('#');
	$('#bgColor').val(finalSelectedColor);
	$('#bgColorInputCheck').val('N');
}
//web
function selWebBgColor(){
	var finalSelectedColor = $('#wBgColorName').val();
	if(finalSelectedColor==''){
		alert('백그라운드 컬러를 선택하지 않으셨습니다.');
		$('#wBgColorInputCheck').val('N');
	}else if(finalSelectedColor.length!=7){
		alert('백그라운드 컬러가 잘못 선택되었습니다.');
		$('#wBgColorInputCheck').val('N');
	}else{
		$('#wViewBgColor').css('background-color',finalSelectedColor);
		$('#wBgColorName').attr('readOnly',true);
		$('#wBgColorName').val(finalSelectedColor);
		$('#wBgColor').val(finalSelectedColor);
		$('#wBgColorInputCheck').val('Y');
	}
}

function delWebBgColor(){
	var finalSelectedColor = '';
	$('#wViewBgColor').removeAttr('style');
	$('#wBgColorName').attr('readOnly',false);
	$('#wBgColorName').val('#');
	$('#wBgColor').val(finalSelectedColor);
	$('#wBgColorInputCheck').val('N');
}

//========== 백그라운드 컬러 세팅 부분 =============================/
//========== 주의사항 선택 =========================================/
//모바일
function selMobCautionImg(){
	$("#cautionT").hide();
	$("#cautionI").show();
}
function selMobCautionText(){
	$("#cautionI").hide();
	$("#cautionT").show();
}
function selMobCautionNone(){
	$("#cautionI").hide();
	$("#cautionT").hide();
}
//웹
function selWebCautionImg(){
	$("#wCautionT").hide();
	$("#wCautionI").show();
}
function selWebCautionText(){
	$("#wCautionI").hide();
	$("#wCautionT").show();
}
function selWebCautionNone(){
	$("#wCautionI").hide();
	$("#wCautionT").hide();
}
//========== 주의사항 선택 =========================================/
//=========== 영상 타입 선택=========================================/
function selMvTypeID(){
	$("#mvBox2").hide();
	$("#mvBox1").show();
	$("#mvBoxView1").show();
}

function selMvTypeUrl(){
	$("#mvBox1").hide();
	$("#mvBoxView1").hide();
	$("#mvBox2").show();
	
}
//=========== 영상 타입 선택=========================================/
//=========== 이벤트 type 선택=======================================/
function fn_evt_type(type) {
    if (type == 'U') {
   	$('#nBox').hide();
   	$('#bBox').hide();
   	$('#urlBox').show();
 		if(document.inputForm.wurl[0].checked){
 			$('#custGbn').hide();
 		}
  	}else if (type == 'N') {
   	$('#urlBox').hide();
   	$('#bBox').hide();
  		$('#nBox').show();
  		$('#custGbn').show();
  		$('#bgText1').html('&nbsp;&nbsp;&nbsp;Full 이미지');
  		$('#bgText2').html('&nbsp;&nbsp;100% 확장');
  		$('#bgText3').html('&nbsp;&nbsp;&nbsp;텍스트 이미지');
  	}else if (type == 'B') {
   	$('#urlBox').hide();
   	$('#nBox').show();
		$('#bBox').show();
		$('#custGbn').show();
  		$('#bgText1').html('&nbsp;&nbsp;&nbsp;상위 이미지');
  		$('#bgText2').html('&nbsp;&nbsp;가로 size 고정');
  		$('#bgText3').html('&nbsp;&nbsp;&nbsp;하위 이미지');
  	}
}

function fn_url_type2(type) {
    if (type == 'U') {
    	$('#wIBox').hide();
    	$('#wnBox').hide();
    	$('#wChkBox').hide();
   	$('#wUrlBox').show();
   	$('#wChkBox').hide();
  		if(document.inputForm.wurl[0].checked){
  			$('#custGbn').hide();
  		}
   }else if (type == 'I') {
    	$('#wUrlBox').hide();
   	$('#wnBox').hide();
		$('#wIBox').show();
   	$('#custGbn').show();
   	$('#wChkBox').show();
   }else if (type == 'B') {
    	$('#wUrlBox').hide();
    	$('#wIBox').hide();
    	$('#wnBox').show();
		$('#custGbn').show();
		$('#wChkBox').show();
   }
}