# 🎨 Trouble Painter

## Deprecation Notice 
The project repository has been moved [here](https://github.com/trouble-painter/app). This repository will no longer be updated.

---

<a href="https://www.producthunt.com/posts/trouble-painter?embed=true&utm_source=badge-featured&utm_medium=badge&utm_souce=badge-trouble&#0045;painter" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=486812&theme=light" alt="Trouble&#0032;Painter - &#0035;Drawing&#0032;Mafia&#0032;Game&#0032; | Product Hunt" style="width: 250px; height: 54px" width="250" height="54"/></a>

- [English](README.md) | [한국어](README.ko.md)
- [App Store](https://apps.apple.com/us/app/trouble-painter-drawing-mafia/id6504225709)
- [Play Store](https://play.google.com/store/apps/details?id=kr.co.devstory.troublepainter.prod)
- [Play Video](https://youtu.be/qDiaQmAMVJg)
- [Gemini Competition](https://ai.google.dev/competition/projects/trouble-painter-drawing-mafia-game)

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
