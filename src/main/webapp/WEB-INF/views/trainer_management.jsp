<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너회원관리</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');
body {
	background-color:  rgb(52, 73, 94);
}

#calender {
	background-color: rgb(52, 73, 94);
	height: auto;
	width: 400px;
	margin: 0px;
	margin: 0 auto;
	box-shadow: 10px 10px 10px 10px rgba(0, 0, 0, 0.3);
}
table {
	border: 0;
	width: 100%;
}

td {
	background-color:rgb(52, 73, 94);
	border:0;
	width: 50px;
	height: 50px;
	color: rgb(22, 160, 133);
}

.Calendar {
	text-align: center;
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 45px;
	width: 45px;
	border-radius: 2px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.today {
	background-color: #212529;
	color: rgb(22, 160, 133);
	font-weight: 600;
	cursor: pointer;
}

.futureDay {
	background-color: rgb(52, 73, 94);
	color: rgb(22, 160, 133);
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay,
.today.choiceDay {
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}
#formDiv {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#todayInfo {
	margin-top: 20px;
}

#trainerOrder {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	height: auto;
	margin-top: 10px;
}

.trainerOrderOne {
	margin-top: 3px;
}

#comments {
	align-items: center;
}
#trainerComment {
	display: inline-block;
	flex-direction: column;
	align-items: flex-start;
	margin-top: 10px;
}

#userComment{
	display: inline-block;
	flex-direction: column;
	align-items: flex-start;
	margin-top: 10px;
}

#formButtons {
	display: flex;
	justify-content: flex-end;
}


addActivity {
	display: flex;
	justify-content: flex-end;
}
</style>

<script>
window.onload = function () {
  buildCalendar();
};

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date(); // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성: 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {
  let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
  let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달 마지막날

  let tbody_Calendar = document.querySelector(".Calendar > tbody");
  document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
  document.getElementById("calMonth").innerText = leftPad(
    nowMonth.getMonth() + 1
  ); // 월 숫자 갱신

  while (tbody_Calendar.rows.length > 0) {
    // 이전 출력결과가 남아있는 경우 초기화
    tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
  }

  let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가

  for (let j = 0; j < firstDate.getDay(); j++) {
    // 이번달 1일의 요일만큼
    let nowColumn = nowRow.insertCell(); // 열 추가
  }

  for (
    let nowDay = new Date(firstDate);
    nowDay <= lastDate;
    nowDay.setDate(nowDay.getDate() + 1)
  ) {
    // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

    let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

    let newDIV = document.createElement("p");
    newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
    nowColumn.appendChild(newDIV);

    if (
      nowDay.getDay() == 6 // 토요일인 경우
    ) {
      nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
    }

    if (
      nowDay.getFullYear() == today.getFullYear() &&
      nowDay.getMonth() == today.getMonth() &&
      nowDay.getDate() == today.getDate()
    ) {
      // 오늘인 경우
      newDIV.className = "today";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    } else {
      // 미래인 경우
      newDIV.className = "futureDay";
      newDIV.onclick = function () {
        choiceDate(this);
      };
    }
  }
}

// 날짜 선택
// 날짜 선택
function choiceDate(newDIV) {
  if (document.getElementsByClassName("choiceDay")[0]) {
    // 기존에 선택한 날짜가 있으면
    document
      .getElementsByClassName("choiceDay")[0]
      .classList.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
  }
  newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가

  // 클릭한 날짜의 연도, 월, 일을 추출하여 콘솔에 출력
  const year = String(today.getFullYear()).slice(-2);
  const month = document.getElementById("calMonth").innerText;
  const day = newDIV.innerHTML;
  console.log("선택한 날짜:", year, month, day);

  //클릭한 날짜를 form태그 내의 input태그에 추가
  var selectDate = year+"/"+month+"/"+day
  document.getElementById("selectDate").value = selectDate;
	var selectDate = $('#selectDate').val();
	var trainer_id = $('#trainer_id').val();
	var users_id = $('#users_id').val();

	window.location.href = "/trainer_management?selectDate=" + selectDate + "&trainer_id=" + trainer_id + "&users_id=" + users_id;

}


// 이전달 버튼 클릭
function prevCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() - 1,
    nowMonth.getDate()
  ); // 현재 달을 1 감소
  buildCalendar(); // 달력 다시 생성
}

// 다음달 버튼 클릭
function nextCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() + 1,
    nowMonth.getDate()
  ); // 현재 달을 1 증가
  buildCalendar(); // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
  if (value < 10) {
    value = "0" + value;
    return value;
  }
  return value;
}

function checkNowDate() {
	alert(today);
	var selectDate = document.getElementById('selectDate').value;
	alert(document.getElementById('selectDate').value);
	if (selectDate < today) {
		alert("지난 일정은 수정할 수 없습니다.");
		return false;
	}
}

</script>
</head>

<body>
	<div id="content">
		<div id="calender">
			<table class="Calendar">
				<thead>
					<tr>
						<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
						<td colspan="5"><span id="calYear"></span>년 <span
							id="calMonth"></span>월</td>
						<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
					</tr>
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
				</thead>

				<tbody>
				</tbody>
			</table>
		</div>

		<div id="formDiv">
			<form action="insertTrainerScheldules" method="post" onsubmit="return checkNowDate()">
				<div id="todayInfo">
					<input type="text" id="selectDate" name="selectDate" value="${user.selectDate}" readonly>, ${user.users_name}회원님 일정관리
					<input type="hidden" id="users_id" name="users_id" value="${user.users_id}">
					<input type="hidden" id="trainer_id" name="trainer_id" value="${user.trainer_id}">
				</div>
				<div id="orderTable">
					<table class="table table-dark table-hover" style="max-width: 1200px;">
						<thead>
						<tr>
							<th scope="col">활동</th>
							<th scope="col">횟수</th>
							<th scope="col">단위</th>
							<th scope="col">TC</th>
							<th scope="col">UC</th>
						</tr>
						</thead>
						<tbody id="memberTableBody">
<%--						<c:forEach var="recordData" items="${recordDataList}" varStatus="status">
							<tr id="recordData${status.index}">
								<td><input type="text" id="PLAY_TYPE${status.index}" name="PLAY_TYPE${status.index}" value="${recordData.PLAY_TYPE}" style="width: auto"></td>
								<td><input type="text" id="RCOD_COUNT${status.index}" name="RCOD_COUNT${status.index}" value="${recordData.RCOD_COUNT}"></td>
								<td>
									<select id="RCOD_TYPE${status.index}" name="RCOD_TYPE${status.index}">
										<option value="회" ${recordData.RCOD_TYPE eq '501' ? 'selected' : ''}>회</option>
										<option value="km" ${recordData.RCOD_TYPE eq '502' ? 'selected' : ''}>km</option>
										<option value="세트" ${recordData.RCOD_TYPE eq '503' ? 'selected' : ''}>세트</option>
									</select>
								</td>
								<td><input type="text" id="RCOD_TRCOM${status.index}" name="RCOD_TRCOM${status.index}" value="${recordData.RCOD_TRCOM}"></td>
								<td><input type="text" id="RCOD_USCOM${status.index}" name="RCOD_USCOM${status.index}" value="${recordData.RCOD_USCOM}" readonly></td>
							</tr>
						</c:forEach>--%>

						<c:forEach begin="${fn:length(recordDataList)}" end="4" varStatus="status">
							<tr id="recordData${status.index}">
								<td><input type="text" id="PLAY_TYPE${status.index}" name="play_type" value="" style="width: auto"></td>
								<td><input type="text" id="RCOD_COUNT${status.index}" name="rcod_count" value=""></td>
								<td>
									<select id="RCOD_TYPE${status.index}" name="RCOD_TYPE">
										<option value="회">회</option>
										<option value="km">km</option>
										<option value="세트">세트</option>
									</select>
								</td>
								<td><input type="text" id="RCOD_TRCOM${status.index}" name="RCOD_TRCOM" value=""></td>
								<td><input type="text" id="RCOD_USCOM${status.index}" name="RCOD_USCOM" value="" readonly></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="comments">
					<div id="userComment">
						회원코멘트<br>
						<textarea rows="10" maxlength="300" cols="60" style="margin-top: 8px" readonly></textarea>
					</div>
					<div id="trainerComment">
						트레이너 코멘트<br>
						<textarea rows="10" maxlength="300" cols="60" style="margin-top: 8px">${userSchedule.SDU_COM}</textarea>
					</div>
					<div id="formButtons">
						<button type="reset">취소</button>
						<button type="submit">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

