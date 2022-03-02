# Spotify Login Page

## 진행 순서
- BackEnd - FrontEnd 데이터 흐름
- FireBase / FireBase 인증이란? 
- 이메일 / 비밀번호 로그인 / 로그아웃
- Google 로그인 / 로그아웃
- Apple 로그인 / 로그아웃

---
## 1. FrontEnd - BackEnd 데이터 흐름
- 각 각의 단어 그대로의 의미는, 어떠한 프로세스의 처음과 마지막 단계라는 의미
    - **이것을 소프트웨어의 관점에서는**
        - FrontEnd : 사용자가 프로그램으로 하는 다양한 형태의 행위 (저장, 삭제, 스와이프 등 등,,,) 를 입력받아 처리하는 것
        - BackEnd : FrontEnd와 약속 된 규격에 맞춰서 이러한 여러 입력들을 처리하는 것
- 웹서비스가 나타난 이후에는 FrontEnd와 BackEnd는 인터넷으로 연결이 됨
    <br/><br/>
## 2. FireBase란 
- FireBase는 FrontEnd개발에 필요한 여러 플랫폼을 제공하는 서비스이다.
    - 앞에서 말한 BackEnd의 기능들을 별도의 BackEnd개발 없이, Server-Less로 대체할 수 있는 여러 플랫폼을 제공하는 서비스
   <br/><br/>
## 3. FireBase Auth
- OAuth란?
    - 사용자 인증 방식에 대한 업계 표준
    - ID/PW를 노출하지 않고, OAuth를 사용하는 업체의 API 접근 권한을 위임 받음
    - 인증 과정
        1. User가 App을 통해 Google에 인증 요청.
        2. App과 연결 된 FireBase에서 Google에 Token(각종 정보가 담긴)요청
        3. Google이 User에게 권한 위임 확인 요청
        4. User가 권한 위임 승인
        5. Google이 FireBase에 Token 승인
        6. 로그인 완료
---
