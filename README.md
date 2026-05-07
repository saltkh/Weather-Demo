# Weather Demo

An iOS weather app built in **Swift** using SwiftUI, fetching real-time weather data from the OpenWeatherMap API.

---

## Features

- Current weather conditions for current loaction
- Temperature, humidity, wind speed, and weather description
- Clean SwiftUI interface with dynamic weather icons
- Error handling for network failures

---

## Tech Stack

| | |
|---|---|
| Language | Swift |
| UI Framework | SwiftUI |
| Networking | URLSession |
| API | [OpenWeatherMap](https://openweathermap.org/api) |
| Architecture | MVVM |

---

## Getting Started

### Prerequisites
- Xcode 15+
- iOS 17+ simulator or device
- A free [OpenWeatherMap API key](https://openweathermap.org/api)

### Setup

1. Clone the repo
```bash
git clone https://github.com/saltkh/Weather-Demo.git
```

2. Open `Weather-Demo.xcodeproj` in Xcode

3. Add your API key — find the constant in the project (e.g. `Constants.swift` or `WeatherService.swift`) and replace the placeholder:
```swift
let apiKey = "YOUR_API_KEY_HERE"
```

4. Run on simulator or device with `Cmd + R`

---

## How It Works

1. App calls the OpenWeatherMap API via `URLSession`
2. JSON response is decoded into a Swift model using `Codable`
3. SwiftUI view updates reactively via `@Published` properties

---

## What I'd Add Next

- 5-day forecast view
- Check the weather in a searched city
- Saved cities with UserDefaults persistence
- Dark/light mode toggle
