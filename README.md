🌦️ Weather App – Flutter (OpenWeather API)

A cross-platform mobile application built using Flutter, Provider state management, and OpenWeatherMap API.
This project is developed as part of Mobile Application Development Coursework 1 – Part B (Kingston University BSc Top-Up).

📱 App Features

✔️ Search weather by city
✔️ 5-day / 3-hour weather forecast
✔️ Save favorite cities
✔️ Settings (unit change °C / °F)
✔️ Clean MVVM + Provider architecture
✔️ Responsive UI (Android / iOS / Web)
✔️ Third-party animations (Lottie)

🏛 Architecture Overview

The project follows a Feature-Based Architecture structured for scalability.

lib/
 ├── features/
 │    ├── home/
 │    ├── forecast/
 │    ├── search/
 │    ├── favorites/
 │    └── settings/
 ├── models/
 ├── providers/
 ├── services/
 ├── utils/
 ├── widgets/
 └── main.dart

State Management:

➡️ Provider (ChangeNotifier)

Design Pattern:

➡️ MVVM (Model – View – ViewModel)

🌐 API Integration

This app uses the OpenWeatherMap API:

Current Weather

5-Day Forecast

Parsing JSON Models

Dynamic icons & animations

Example Endpoint:

https://api.openweathermap.org/data/2.5/weather?q=Colombo&appid=YOUR_API_KEY&units=metric

🎨 UI/UX Features

Material 3 UI

Clean, minimal card layout

Light theme

Lottie animations

Intuitive navigation drawer

Floating search button

📦 Third-Party Packages Used
Package	Purpose
provider	State management
http	API calls
lottie	Weather animations
intl	Date/time formatting
🚀 Getting Started (Run Locally)
1. Clone the repository
git clone https://github.com/it21175770/weather_app.git

2. Go to project folder
cd weather_app

3. Install dependencies
flutter pub get

4. Run the app
flutter run

📲 Release APK

Download the latest release APK here:
👉 Download APK

(Replace with your actual Drive link.)

🎥 Demo Video

You can watch the full demo video here:
👉 Demo Video Link

🧪 Testing

Included:

Basic widget test (widget_test.dart)

Manual UI testing across:

Android physical device

Chrome (Web Debug)

🛠 How to Build APK
flutter build apk --release


Release file path:

/build/app/outputs/flutter-apk/app-release.apk

📚 References

OpenWeatherMap API Docs

Flutter Documentation

Provider State Management Docs

Material Design Guidelines

👨‍💻 Developer
Module: Mobile Application Development
Institute: ESOFT Metro Campus

🔒 Academic Honesty Note

This repository is created for educational purposes as part of Kingston University's assignment submission.
Please do not copy without proper referencing.
