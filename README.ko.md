# 🎨 Trouble Painter

<a href="https://www.producthunt.com/posts/trouble-painter?embed=true&utm_source=badge-featured&utm_medium=badge&utm_souce=badge-trouble&#0045;painter" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=486812&theme=light" alt="Trouble&#0032;Painter - &#0035;Drawing&#0032;Mafia&#0032;Game&#0032; | Product Hunt" style="width: 250px; height: 54px" width="250" height="54"/></a>

- [English](README.md) | [한국어](README.ko.md)
- [앱 스토어](https://apps.apple.com/us/app/trouble-painter-drawing-mafia/id6504225709)
- [플레이 스토어](https://play.google.com/store/apps/details?id=kr.co.devstory.troublepainter.prod)
- [플레이 영상](https://youtu.be/qDiaQmAMVJg)
- [Gemini 대회](https://ai.google.dev/competition/projects/trouble-painter-drawing-mafia-game)

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
