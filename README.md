# Flutter Mini App Assessment

## Overview

This project is a simple Flutter mobile application built using **Clean Architecture** principles.
It demonstrates login flow, API data consumption, navigation, and scalable project structure.

The app fetches and displays SpaceX launches from a public API.

---

## Features

* Login screen (accepts any non-empty input)
* Launch list from public REST API
* Details screen navigation
* Bloc state management
* Clean architecture separation
* Dependency injection (manual)
* Error handling

---

## Architecture

The project follows a layered structure:

```
lib/
 └── features/
     ├── auth/
     └── launches/
         ├── data/
         ├── domain/
         └── presentation/
```

### Layers

* **Domain**

    * Entities
    * Repository contracts
    * Use cases

* **Data**

    * API models
    * Data sources
    * Repository implementation

* **Presentation**

    * Bloc state management
    * UI screens

This structure ensures scalability, testability, and maintainability.

---

## Tech Stack

* Flutter
* Bloc
* Dio (HTTP client)
* Equatable

---

## Setup Instructions

```bash
git clone <repo-url>
cd flutter_mini_app_assessment
flutter pub get
flutter run
```

---

## Notes

* Architecture designed for production scalability
* API results sorted and limited for performance
* Business logic separated from UI layer

---

## Author

Jonathan Cenas
