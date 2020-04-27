
## Project goals
#### :lock: As a anonymous user
* I want to sign up using my **Facebook** account.
* I want to sign in using my **Facebook** account.
#### :unlock: As a logged in User
* I want to see a list of tourist spots in a 5 km radius from a given location.
* I want to search for tourist spots by name.
* I want to register a tourist spot (picture, name, geographical location and category).
* I want to comment about a tourist spot.
* I want to see comments about a tourist spot.
* I want to add pictures to a tourist spot.
* I want to remove pictures I added to a tourist spot.
* I want to favorite a tourist spot.
* I want to see my favorites tourist spots.
* I want to remove a tourist spot from my favorites.
* I want to update a tourist spot.
* I want to see the tourist spots I registered.
* I want to create new categories.

## TODO

- [ ] I want to see a list of tourist spots in a 5 km radius from a given location.
- [ ] I want to create new categories.

## Running the project with Firebase

To use this project with Firebase authentication, some configuration steps are required.

- Create a new project with the Firebase console.
- Add iOS and Android apps in the Firebase project settings.
- On Android, use `br.com.challengesnowman` as the package name.
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.
- On iOS, use `br.com.challengesnowman` as the bundle ID.
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_ios_app) `GoogleService-Info.plist` into `iOS/Runner`, and add it to the Runner target in Xcode.

See this document for full instructions:

- [https://firebase.google.com/docs/flutter/setup](https://firebase.google.com/docs/flutter/setup)

Additional setup instructions for Facebook sign-in:

- Facebook Login for Android: [https://developers.facebook.com/docs/facebook-login/android](https://developers.facebook.com/docs/facebook-login/android)
- Facebook Login for iOS: [https://developers.facebook.com/docs/facebook-login/ios](https://developers.facebook.com/docs/facebook-login/ios)

## [License: MIT](LICENSE.md)