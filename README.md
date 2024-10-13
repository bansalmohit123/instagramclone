# Instagram Clone

A new Flutter project.

## Project Title
Instagram Clone is an application that mimics the features of Instagram, allowing users to create accounts, post images, follow others, and interact through likes and comments. The app utilizes Firebase for authentication, database storage, and image hosting.

## Firebase Setup

To run this project, you'll need to set up a Firebase project and configure it for the app. Follow these steps:

1. Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
2. Once your project is created, add an Android or iOS app to your Firebase project.
3. Download the configuration files:
   - For Android: `google-services.json` (place it in `android/app/` directory).
   - For iOS: `GoogleService-Info.plist` (place it in the `ios/Runner/` directory).
4. In your Firebase project, enable the following services:
   - **Authentication**: Set up email/password authentication.
   - **Firestore Database**: Enable Firestore as the database for storing user data.
   - **Firebase Storage**: Enable Firebase Storage for handling image uploads.
   
Once the project is set up and the configuration files are added to the app, you're ready to run the project.


## Authors

- [@mohitbansal](https://github.com/bansalmohit12)

## Run Locally

To run the Instagram clone locally, follow these steps:

1. Clone the project repository from GitHub:

   ```bash
   git clone https://github.com/yourusername/instagram_clone.git

2. Go to the project directory

   ```bash
   cd instagram_clone

3. To start the flutter app first install the dependencies
   
   ```bash 
   flutter pub get
   ```



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
