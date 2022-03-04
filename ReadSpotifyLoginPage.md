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
## 개발 중 유의사항

### 1. IOS15 업데이트 이후 NavigationBar 관련 변경사항
- 아이폰13이 나오면서 IOS15가 업데이트 되었는데, NavigationBar관련 업데이트 사항이 있음
- 업데이트 이후 NavigationBar의 ```scrollEdgeAppearance``` 는 기본적으로 투명한 배경을 생성이 된다.
    - 즉 뒤에 컨텐츠가 없으면 기본적으로 투명한 배경색이 보이게 됨
    - 이는, View에 Background를 색을 지정하면 NavigationBar의 시각성을 저해함
- 이를 해결하기 위해서는 ```UINavigationBarAppearance```를 사용해야 한다.
```swift
if #available(iOS 15.0, *) {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.configureWithDefaultBackground()

    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
}
```
- 여기서 핵심은, ```scrollEdgeAppearance```를 ```standardAppearance```와 동일하게 설정해야한다는 것
- 이러한 설정은 기본적으로 AppDelegate에서 실행되도록 하는것이 좋음

### 2. GIDSignInDelegate 채택 시 문제 발생
- 기본적으로 cocoapod에서 ```pod 'GoogleSignIn'```을 추가 후<br/>
 ```GIDSignInDelegate``` 를 채택 할 경우 GoogleSignIn 6.0이상의 버전에서는 채택이 불가능한 상황을 발견 하였다.
 - 이를 해결하기 위해 ```pod 'GoogleSignIn' , '~> 5.0'```를 새로 입력하여, 5.X 버젼으로 다운그레이드 할 필요가 있다.
 - 이후에 GIDSignInDelegate를 정상적으로 채택 할 수 있다.

 ---

 # _*추가적으로, Apple 로그인의 경우 Apple Develope Membership에 가입해야 해서 비용 절감을 위해 따로 실제 기능 추가는 하지 않고 공부만 진행함...*_