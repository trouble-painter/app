# Trouble Painter 🪄
<a href="https://www.producthunt.com/posts/trouble-painter?embed=true&utm_source=badge-featured&utm_medium=badge&utm_souce=badge-trouble&#0045;painter" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=486812&theme=light" alt="Trouble&#0032;Painter - &#0035;Drawing&#0032;Mafia&#0032;Game&#0032; | Product Hunt" style="width: 250px; height: 54px" width="250" height="54"/></a>

- [AppStore](https://apps.apple.com/us/app/trouble-painter-drawing-mafia/id6504225709)
- [PlayStore](https://play.google.com/store/apps/details?id=kr.co.devstory.xpr)
- [Play Video](https://youtu.be/qDiaQmAMVJg)
- [Gemini Competition](https://ai.google.dev/competition/projects/trouble-painter-drawing-mafia-game)



![page1](https://github.com/user-attachments/assets/c2774af5-97c2-439d-b45b-ddee3d796600)
![page2](https://github.com/user-attachments/assets/cf220f1a-7634-4502-886a-c0d482f09385)
![page3](https://github.com/user-attachments/assets/cfa39950-498d-494e-865d-ccc53be41178)
![page4](https://github.com/user-attachments/assets/e466b802-8795-41f4-8a1f-2d533fd4e2ba)

## How to Play
1. Gather 3 to 10 players.
2. A drawing keyword and one Trouble Painter are randomly assigned.
   - Trouble Painter: Draws without knowing the keyword and tries to avoid detection.
   - Good Painter: Draws based on the keyword and must keep it hidden from the Trouble Painter.
3. The game has two rounds, with each player adding one stroke per turn.
4. After all drawings are done, players vote to identify the Trouble Painter.
5. If the Trouble Painter is identified, they get a chance to guess the keyword.
6. If they guess correctly, the Trouble Painter wins. If not, the Good Painters win.

The app features an AI Hint function using Gemini's Vision capability to assist the Trouble Painter in guessing the keyword.
1. Players' drawings and the keyword are analyzed by Gemini.
2. Gemini generates a context-based hint.
3. The hint is provided to the Trouble Painter.

## Features
- Flutter
- Flavor : dev / prod 
- Riverpod
- Design System
- Multi-language support
- MVVM & Clean Architecture
- Google Analytics

## How to start
- Run `make init`

### Project Structure
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
- [Flutter 앱 개발 기초](https://inf.run/HFSvE)
- [Flutter 앱 개발 실전](https://inf.run/aDUs)
