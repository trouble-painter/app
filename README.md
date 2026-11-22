# 🎨 Trouble Painter

## Deprecation Notice 
The project repository has been moved [here](https://github.com/trouble-painter/app). This repository will no longer be updated.

---

- [English](README.md) | [한국어](README.ko.md)
- [App Store](https://apps.apple.com/app/id6836675233)
- [Play Store](https://play.google.com/store/apps/details?id=kr.co.devstory.troublepainter.prod)
- [Play Video](https://youtu.be/qDiaQmAMVJg)
- Blog
  - Part 1: [한국어](https://blog.devstory.co.kr/post/trouble-painter-01/) | [English](https://blog.devstory.co.kr/en/post/trouble-painter-01/)
  - Part 2: [한국어](https://blog.devstory.co.kr/post/trouble-painter-02/) | [English](https://blog.devstory.co.kr/en/post/trouble-painter-02/)

![en1-min](https://github.com/user-attachments/assets/f4d8f15d-4225-4dee-b6db-a3cf8c96095e)
![en2-min](https://github.com/user-attachments/assets/0969ad42-1262-48f4-a63d-e0749afb8c02)
![en3-min](https://github.com/user-attachments/assets/5a306275-41ff-4add-9986-98c5b26a23b8)
![en4-min](https://github.com/user-attachments/assets/14ee5d93-fb9d-4480-938f-1a8716a58008)

## Features
- Flutter
- Flavor : dev / prod 
- Riverpod
- Design System
- Multi-language support

## How to start
- Run `make init`

## Project Structure
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

## References
- [Flutter app development basics](https://inf.run/HFSvE)
- [Flutter app development practice](https://inf.run/aDUs)
