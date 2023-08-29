# 내가 편하려고 만든 스크립트

## 대상

- Mac 환경에서 개발하는, 개발환경 설정을 편하게 하고싶은 React Native 개발자

## 주의사항

- M1 칩을 사용하는 맥북프로(2021)에서만 테스트됨
- 코드로 인해 발생한 문제에 대해서는 책임지지 않습니다
- 본 코드는 초기화된 디바이스에서 최초로 환경설정을 진행할 때를 상정한 코드입니다

## 알려진 문제

<!-- - nvm 관련 설정이 비정상 동작하네요. 우선 해당 옵션 비활성화하겠습니다. brew install node를 통해 node를 설치하여 사용하시거나 nvm 설치 완료 후 nvm 설정 스크립트를 수동으로 진행하시면 됩니다. -->

- ruby 버전은 리액트 네이티브 0.70.5 버전 기준으로 반영되었으며,0.71.x 부터는 2.7.6을 사용합니다. <https://github.com/facebook/react-native/blob/v0.71.3/.ruby-version>

## 사용법

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

## 예정

- rnve, nvm, Java 등 asdf로 대체

## inspired by and thanks to

- <https://github.com/dev-yakuza/development-environment-for-mac-os>
- <https://github.com/smileostrich/mac-auto-setup>
- <https://github.com/seongjoojin/mac-dev-setup>
- <https://gist.github.com/CliffordAnderson/817777b5dc0e67769e4b>
- <https://velog.io/@haejeonghy/Homebrew-Tap-%EC%82%AC%EC%9A%A9>
