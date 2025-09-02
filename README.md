🚖 Evana — Women‑Only Ride Hailing (Flutter + Firebase)

[![Flutter](https://img.shields.io/badge/Flutterbaseenseing app designed for a safer, women‑only experience, connecting female riders with female drivers using real‑time location, secure auth, and modern UX. 💜🛡️
✨ Highlights

    👩‍🦰👩‍✈️ Women‑only rider/driver flows for safety and comfort-first ride booking.

🗺️ Real‑time map, live driver tracking, and ETA updates with Firebase.

🔐 Secure authentication, profile verification, and role-based access.

💳 Extensible payments and fare estimation architecture.

📱 Smooth, responsive UI with Flutter for Android and iOS.
🧱 Architecture

    Client: Flutter (Dart), layered UI → State → Services → Models.

Backend: Firebase Auth, Firestore, Cloud Functions, FCM for push.

Maps/Geo: Google Maps SDK and geolocation helpers.
📦 Project Structure

    mobile app in Flutter with Dart as primary language and supporting native glue (Swift, C++, CMake) as shown by repo language breakdown.

🖥️ Screens & Flows

    Rider: signup → set pickup/drop → fare estimate → request → live tracking → rate.

Driver: onboarding/verification → accept ride → navigate → complete → earnings.

Safety: women‑only matching and privacy-minded defaults.
🚀 Getting Started

    Prerequisites

    Flutter SDK and Dart set up locally.

Firebase project with iOS/Android apps configured.

Google Maps SDK keys for Android and iOS.

    Clone and install

bash
git clone https://github.com/Hassaan1805/Evana.git
cd Evana
flutter pub get

    Configure Firebase

    Add google-services.json (Android/app) and GoogleService-Info.plist (iOS/Runner).

Enable Auth providers (email/phone) and create Firestore database.

    Configure Maps

    Add API keys to AndroidManifest.xml and AppDelegate/Info.plist per platform guides.

    Run the app

bash
flutter run

🔧 Environment Setup

    Firebase: Auth, Firestore, Functions (optional for pricing/matching).

FCM: push notifications for ride status updates and driver arrivals.

Maps: Directions, Places (for autocomplete), and Maps SDK enabled.
🧭 Feature Roadmap

    🆔 Driver and rider verification flows with document checks.

💳 Payments: provider integration and secure tokenization.

🧮 Pricing: distance/time-based fare with surge logic in Functions.

🛡️ Safety: SOS shortcuts, trip sharing, moderation tools.

🌐 Localization and accessibility improvements.
🧪 Testing

    Unit tests for services and models; widget tests for core screens.

Staging Firebase project recommended for safe testing.
🤝 Contributing

Contributions are welcome—fork, branch, and open a PR with context, screenshots, and testing notes. 👩‍💻👨‍💻
📜 License

MIT — see LICENSE for details.
🙌 Credits & Inspiration

    Open-source Flutter + Firebase taxi apps and learning repos informed UX and structure.

Community tutorials covering maps, auth, and ride flows were helpful references.
