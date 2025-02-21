# Quick Event

## Overview
The Quick Event App is a Flutter application designed to showcase skills in mobile app development, including user authentication, push notifications, and Firebase integration. The app demonstrates proficiency in Flutter, best practices, appropriate architecture patterns, UI design, state management, and external API integration.

## Features
- **User Authentication**: Sign up, log in, and log out using Firebase Authentication.
- **Profile Management**: Users can upload a profile picture, and edit personal information (First Name, Last Name, Email, Phone Number, Mailing Address).
- **Home Page**:
    - Top Image Slider: Displays the first 10 images from an external API.
    - Event Organizers List: Shows a list of event organizers fetched from an external API.
    - Horizontal Image List: Displays a horizontal list of images with descriptions.
    - Post Count and Navigation: Displays the total number of posts and allows navigation to a posts list with comments.
- **Push Notifications**: Daily push notifications scheduled at 8 am, 12 noon, and 5 pm using Firebase Cloud Messaging (FCM).
- **Form Validation**: Real-time validation for login, signup, and profile edit forms.
- **Unit Testing**: Unit tests for critical components, including form validation and API calls.

## Technologies Used
- **Flutter**: For building the cross-platform mobile application.
- **Firebase**: For user authentication, profile management, and push notifications.
- **Provider**: For state management.
- **External APIs**: For fetching images, event organizers, posts, and comments.

## Setup Instructions

### Prerequisites
- Flutter SDK installed (version 3.0.0 or higher).
- Firebase project set up with Authentication and Cloud Messaging enabled.
- Android Studio or VS Code with Flutter and Dart plugins installed.

### Steps to Run the Project
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MadukaNuwantha/quick-event.git
   cd quick-event

2. **Install Dependencies**:
   ```bash
   flutter pub get

3. **Run the App**:
   ```bash
   flutter run

4. **Run Unit Tests**:
   ```bash
   flutter test

## Known Issues
- Push notifications are currently scheduled for specific times but may not work in all environments due to device-specific settings.
- Some API responses may take longer to load on slower networks.
- Due to Firebase Storage being a paid service, the profile picture upload feature has been omitted. The app focuses on core functionalities like authentication, profile management, and API integrations.