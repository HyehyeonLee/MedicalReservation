# 감염병 재난(코로나19) 대비 진료소 예약 프로그램(Spring)

개발 환경 : java 1.8.0, Spring Legacy, MySQL 8.0.21, apache-tomcat-8.5.57, window 10<br />
개발 기간 : 2020.10.15 ~ 2020.11.10 <br />
개발 인원 : 4명 (
<a href = "https://github.com/HyehyeonLee" target = "_blank">이혜현</a>,
<a href = "https://github.com/adoo93" target = "_blank">고두영</a>,
<a href = "https://github.com/Sangkun-svg" target = "_blank">김상혁</a>,
박현) <br />
프로젝트 설계서 PPT : https://url.kr/tu1jcz (google drive link)<br />
완성 PPT : https://url.kr/v3ekb4 (google drive link)

## 1. 개요
2020년 1월 국내 코로나 19 확진자 첫 발생 당시 진료소 예약 관련 체계가 잡혀있지 않아 진료소 현장 대기 시간과 질병 관리 본부 통화 대기 시간이 증가했습니다.<br />
이에 <b>비대면식 진료소 예약 시스템 필요성</b>을 제기하여 진료소 예약 프로그램을 제작하게 되었습니다.
<br />

## 2. 역할 분담
<ul>
  <li>이혜현 : 진료소 검색, 진료소 예약, 구호 물품 신청, 프론트엔드</li>
  <li>고두영 : 로그인 및 회원가입, 채팅, 이메일 건의</li>
  <li>게시판, 채팅, 프론트엔드</li>
  <li>박현 : 확진자 그래프, 진료소 예약, 구호 물품 신청</li>
</ul>

## 3. DB 설계
Table : 회원, 환자측 예약 정보, 병원측 예약 정보, 구호물품, 게시판, 게시판 댓글, 게시판 파일 첨부
<br />


## 4. 기능
<ul>
  <li>로그인 - 카카오 & 네이버 API 연동</li>
  <li>회원가입 - 다음(카카오) 우편번호 API 연동</li>
  <li>확진자 그래프 - 공공데이터포털 제공 데이터를 파싱한 후 chart.js를 사용하여 구현</li>
  <li>진료소 검색 - 공공데이터포털 제공 데이터를 파싱한 후 지역 별로 검색 가능하게 구현</li>
  <li>진료소 예약 - 원하는 날짜, 시간에 예약, <br />
    환자 측에서 예약 완료시 진료소 측에서 실시간으로 확인하도록 Ajax와 WebSocket을 사용해 구현</li>
  <li>실시간 상담 - WebSocket을 사용하여 실시간 채팅 구현, 최대 4명까지 상담 가능</li>
  <li>이메일 문의 - JAVA mail API를 사용하여 웹페이지 내에서 메일 전송 기능 구현</li>
  <li>게시판 - 댓글 기능과 파일 첨부 기능을 구현</li>
  <li>구호 물품 신청 - 원하는 구호 물품을 10만원 내로 선택하도록 기능 구현</li>
</ul>
<br />
