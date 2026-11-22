# 🎨 Trouble Painter

- [English](README.md) | [한국어](README.ko.md)
- [앱 스토어](https://apps.apple.com/app/id6836675233)
- [플레이 스토어](https://play.google.com/store/apps/details?id=kr.co.devstory.troublepainter.prod)
- [플레이 영상](https://youtu.be/qDiaQmAMVJg)
- 블로그
  - 1편: [한국어](https://blog.devstory.co.kr/post/trouble-painter-01/) | [English](https://blog.devstory.co.kr/en/post/trouble-painter-01/)
  - 2편: [한국어](https://blog.devstory.co.kr/post/trouble-painter-02/) | [English](https://blog.devstory.co.kr/en/post/trouble-painter-02/)

![ko1-min](https://github.com/user-attachments/assets/b4d3e679-5688-4870-9fa3-790091cd134f)
![ko2-min](https://github.com/user-attachments/assets/d65f61cb-9a52-4093-835d-2fd5ea22d12a)
![ko3-min](https://github.com/user-attachments/assets/9242390e-0c45-4cf3-be85-d82626281838)
![ko4-min](https://github.com/user-attachments/assets/237c1607-91c2-49b7-baad-d3bd828db572)

## 특징
- Flutter
- Flavor : dev / prod 
- Riverpod
- Design System
- Multi-language support

## 시작 방법
- Run `make init`

## 프로젝트 구조
```
lib
 ├─ .env
 │   ├─ dev
 │   │  ├─ .env
 │   │  ├─ firebase_options.dart
 │   │  ├─ google-services.json
 │   │  └─ GoogleService-Info.plist
 │   ├─ prod
 │   │  ├─ .env
 │   │  ├─ firebase_options.dart
 │   │  ├─ google-services.json
 │   │  └─ GoogleService-Info.plist
 │   └─ flavorizr.yaml
 ├─ app
 │   ├─ pages
 │   └─ routes
 ├─ core
 │   ├─ localization
 │   ├─ theme
 │   └─ utils
 └─ features
     └─ feature1
        ├─ data
        │  ├─ models
        │  ├─ repositories
        │  └─ sources
        └─ domain
           ├─ entities
           ├─ usecases
           └─ services
 ```

## 참고
- [Flutter 앱 개발 기초](https://inf.run/HFSvE)
- [Flutter 앱 개발 실전](https://inf.run/aDUs)
