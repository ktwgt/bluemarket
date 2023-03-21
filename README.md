# :pushpin: bluumarket
블루마켓 프로젝트

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 2월 2일 ~ 3월 20일
- 공동 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java
  - Spring Boot
  - Apache Tomcat
  - JSON
  - MySQL
#### `Front-end`
  - kakao-login API
  - kakao-map API
  - FullCalendar API

</br>

## 3. ERD 설계
![블루마켓 ERD](https://user-images.githubusercontent.com/124217957/226547037-100e0921-2144-4a6e-bb82-37a7cf85ea70.PNG)


## 4. 핵심 기능
이 사이트의 핵심 기능은 중고물품 판매와 구매의 중개 기능입니다.  
사용자는 물품을 검색하고 해당 판매자 또는 구매자와 대화를 통해 연결됩니다.  
이를 돕기 위하여 지도 및 일정 API가 추가되어 있고, 채팅 기능이 구현되어 있습니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![블루마켓 프로세스](https://user-images.githubusercontent.com/124217957/226548705-3ae759ca-25b8-4423-becf-38837b07edf5.PNG)


### 4.2. 판매일정

![판매일정](https://user-images.githubusercontent.com/124217957/226549639-c47c7456-5775-4115-9c74-564ca413d924.PNG)


### 4.3. 우리동네 (지도로 보기)

![우리동네](https://user-images.githubusercontent.com/124217957/226549684-9b4622c3-4b45-4b23-ba58-4fc0f9e58071.PNG)


### 4.4. 블루톡 (채팅)

![블루톡1](https://user-images.githubusercontent.com/124217957/226550000-44887955-fbb3-4e82-9473-68af352539f9.PNG)

- **메인페이지에서 블루톡 내역 보기** 
  - 블루톡 클릭 시 채팅방 목록 보여주기. 
    이제까지 대화했던 대화방 목록이 표시되고, 대화한 적이 없었다면 표시하지 않는다.


![블루톡2](https://user-images.githubusercontent.com/124217957/226550008-75f2162d-43d1-4490-a672-e55e55e1bde3.PNG)

- **판매 또는 구매글에서 해당 판매자와 대화** 
  - 원하는 물품을 클릭하면 해당 물품의 판매요청 또는 구매요청자와 대화가 연결된다. (흔히 아는 카카오톡처럼 대화방 생성)


</div>
</details>

</br>


## 5. 마무리하며
처음 해본 프로젝트였으며, 공동프로젝트였다.<p>
완성된 뒤에 돌아보니 이 부분을 이렇게 했으면 어땠을까 하는 아쉬움이 남는다.<p>
팀원에게 고마웠던 점, 아쉬웠던 점이 공존한다.<p>
이 프로젝트를 계기로 스스로가 할 수 있다는 자신감을 가졌고, 한 단계 성장할 수 있었다.
