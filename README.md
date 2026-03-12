# 🎬 N-Explorer - Premium Netflix Clone

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![API Source](https://img.shields.io/badge/API-TMDb-red.svg)](https://www.themoviedb.org/)

**N-Explorer** is a high-fidelity Video-on-Demand (VoD) application built with Flutter. It delivers a seamless cinematic browsing experience by integrating real-time data from the TMDb API, featuring local data persistence and a modern, responsive UI.

---

## 🌟 Key Features

* **Immersive UI:** Parallax scrolling effects and custom gradients using `Slivers`.
* **Live TMDb Integration:** Real-time synchronization with the global movie/TV database.
* **Smart Search:** Instant content filtering with a responsive grid layout.
* **Offline Bookmarking:** Save favorites to local storage for quick access.

---

## 📸 Screenshots

| Welcome / Login | Home Explore | Search & Grid | Details & Cast |
| :---: | :---: | :---: | :---: |
| ![Login](./screen_1.jpg) | ![Explore](./lib/assets/home_preview.jpg) | ![Search](./screen_4.jpg) | ![Details](./screen_2.jpg) |

---

## 🛠️ Technical Implementation

### 4. Dynamic Navigation (See All)
The **See All** button in `HomeScreen` is fully functional. It passes the fetched list of shows to a generic `CategoryScreen`, allowing users to explore entire genres in a 3-column grid layout.

### 5. Local Data Persistence (Add to List)
In the `DetailScreen`, the "Add to My List" button triggers the `DatabaseService`. Using the `shared_preferences` package, the app serializes the `TvShow` object into a JSON string and stores it in the device's internal memory.

### 6. Reactive List Management
The **My List** tab uses a `FutureBuilder` to fetch data asynchronously from local storage. It features an "Empty State" UI that guides users to add content if their list is currently empty.

---

## ⚙️ Installation & Setup

### 1. Prerequisites
* **Flutter SDK** (Latest stable version)
* **IDE** (VS Code or Android Studio)
* **TMDb API Key**

### 2. Clone the Repository
```bash
git clone [https://github.com/vbaltaru/n-explorer-flutter.git](https://github.com/vbaltaru/n-explorer-flutter.git)
cd n-explorer-flutter
```
### 3.Install Dependencies
```bash
flutter pub get
```
### 4. Configuration
* **Open lib/services/api_service.dart and replace the placeholder with your key:
```bash
static const String apiKey = 'YOUR_API_KEY_HERE';
```
### 5. Launch
```bash
flutter run
```
