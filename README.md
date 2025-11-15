Flutter API & Map Integration
A comprehensive Flutter application that demonstrates user authentication, profile management, and interactive map integration with real-time location display.

🚀 Features
🔐 Authentication
Login System: Email and password validation

Secure Storage: Hive database for local data persistence

Session Management: Automatic user session handling

👤 User Profile
Complete Profile Display: Personal info, contact details, address, and company information

Edit Profile: In-app profile editing with real-time updates

Data Validation: Form validation for all user inputs

API Integration: RESTful API communication for user data

🗺️ Interactive Maps
Multiple Map Styles: Standard, Dark, and Satellite views

Real-time Location: Animated markers with user information

Zoom Controls: Interactive zoom in/out functionality

Bottom Sheet: Collapsible user information panel

Coordinates Display: Real-time latitude/longitude tracking

🛠️ Technical Stack
Flutter: Cross-platform mobile development

Hive: Lightweight and fast local database

HTTP: REST API communication

flutter_map: Interactive mapping solution

latlong2: Geographic coordinates handling

📱 Screens
1. Login Screen
Email and password authentication

Form validation

API integration for user verification

2. Profile Screen
User information display

Editable profile fields

Company and address details

Navigation to map view

3. Map Screen
Interactive map with multiple styles

User location marker

Zoom controls and recenter functionality

Collapsible information panel

🗂️ Project Structure
text
lib/
├── model/
│   ├── User.dart
│   ├── Address.dart
│   ├── Company.dart
│   └── Geo.dart
├── screen/
│   ├── login_screen.dart
│   ├── profile_screen.dart
│   └── map_screen.dart
├── service/
│   └── user_api_service.dart
└── database/
    └── db_helper.dart
🔧 Installation
Clone the repository

bash
git clone https://github.com/your-username/api_and_map.git
cd api_and_map
Install dependencies

bash
flutter pub get
Run the application

bash
flutter run
📋 Prerequisites
Flutter SDK (latest version)

Dart SDK

Android Studio/VSCode with Flutter extension

Internet connection for API calls and map tiles

🔌 API Integration
The app uses JSONPlaceholder API for demonstration:

Base URL: https://jsonplaceholder.typicode.com/users

GET User: /users/{id}

UPDATE User: PUT /users/{id}

💾 Local Storage
Hive Database: For offline data persistence

User Sessions: Automatic login state management

Profile Caching: Fast access to user data

🎨 UI/UX Features
Material Design: Modern and intuitive interface

Responsive Layout: Adapts to different screen sizes

Smooth Animations: Enhanced user experience

Custom Themes: Consistent color scheme throughout

🔒 Security Features
Input validation and sanitization

Secure local data storage

API error handling

Session management

📈 Performance
Efficient state management

Optimized API calls

Smooth map rendering

Fast local database operations

🤝 Contributing
Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📄 License
This project is licensed under the MIT License - see the LICENSE.md file for details.

🙏 Acknowledgments
JSONPlaceholder for free fake API

OpenStreetMap for map tiles

Flutter community for excellent packages
