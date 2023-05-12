# 대상

- ARM 기반 Mac을 사용하는, 개발환경 설정을 편하게 하고싶은 React Native 개발자

# 사용법

1. git clone 등의 방법으로 Makefile과 Brewfile 다운로드
2. 해당 폴더에서 실행한 터미널에서 make install 입력
3. 애플 개발자 도구 설치해야 한다는 팝업 표시되면 설치
4. 애플 개발자 도구 설치 완료 후 다시 동일 터미널에서 make install 입력
5. Homebrew 설치 후 “파일을 찾을 수 없음” 에러 발생시 터미널을 껐다가 다시 실행해서 make install 입력 (현 시점 정상 실행시 시작부터 과정 중 총 3회 입력, 개선필요함)
6. sudo 권한 요구 시에는 사용자 비밀번호 입력
7. xcode 설치시에는 apple 개발자 계정 입력
8. 설치된 앱이 일괄로 실행되면서 권한을 요구하는데, 문제가 없다면 권한 줄 것
   (앱스토어에서 다운받은 프로그램이 아니면 실행시 권한 요구함)
9. Github 설정 등은 사용자가 직접 진행해야 함([새 SSH 키 생성 및 ssh-agent에 추가](https://docs.github.com/ko/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))
10. xcode에서 cli 연결 진행
    
    a. sudo gem install cocoapods가 코드에 누락되어 있으므로 yarn ios:dev 진행시에는 sudo gem install cocoapods를 먼저 진행 후 ios 폴더에서 pod install 실행할 것
    
    b. yarn android:dev || yarn ios:dev 시에 launchPackager.command이(가) 터미널에서 문서를 열도록 허용되지 않았기 때문에 '(null)'을(를) 열 수 없습니다. 에러 발생시 링크 참조 [[RN에러노트]launchpackager.command이 가 터미널에서 문서를 열도록 허용되지 않았기 때문에 null 을 를 열 수 없습니다.](https://velog.io/@rudans987/RN%EC%97%90%EB%9F%AC%EB%85%B8%ED%8A%B8launchpackager.command%EC%9D%B4-%EA%B0%80-%ED%84%B0%EB%AF%B8%EB%84%90%EC%97%90%EC%84%9C-%EB%AC%B8%EC%84%9C%EB%A5%BC-%EC%97%B4%EB%8F%84%EB%A1%9D-%ED%97%88%EC%9A%A9%EB%90%98%EC%A7%80-%EC%95%8A%EC%95%98%EA%B8%B0-%EB%95%8C%EB%AC%B8%EC%97%90-null-%EC%9D%84-%EB%A5%BC-%EC%97%B4-%EC%88%98-%EC%97%86%EC%8A%B5%EB%8B%88%EB%8B%A4)
    → 해당 오류 회피는 metro를 따로 실행한 후에 ios나 android를 실행하는 형태로 회피할 수 있는 듯

# 주의사항

- M1 칩을 사용하는 맥북프로(2021)에서만 테스트됨
- 공유한 코드로 인해 발생한 문제에 대해서는 책임지지 않습니다
