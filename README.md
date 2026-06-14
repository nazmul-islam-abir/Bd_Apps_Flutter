# Social Media Profile UI

A clean Flutter social profile screen built for a mobile app interface. The design includes a large profile hero, follower statistics, editable profile actions, story-style highlights, a gallery preview, and a scrollable post feed.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-111827?style=for-the-badge)

## Preview

<table>
  <tr>
    <td width="50%">
      <h3>Profile Hero</h3>
      <img src="assets/s1.png" alt="Profile hero screen" width="100%">
      <p>The opening profile card presents the user name, handle, short bio, menu action, and follow button over a full image background.</p>
    </td>
    <td width="50%">
      <h3>Stats and Highlights</h3>
      <img src="assets/s2.png" alt="Stats and highlights screen" width="100%">
      <p>Follower and following cards are paired with edit actions and circular highlight items for quick profile navigation.</p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <h3>Gallery Grid</h3>
      <img src="assets/s3.png" alt="Gallery grid screen" width="100%">
      <p>The media section shows profile content in a compact gallery layout with counters for posts, photos, videos, and saved items.</p>
    </td>
    <td width="50%">
      <h3>Post Feed</h3>
      <img src="assets/s4.png" alt="Post feed screen" width="100%">
      <p>The post feed includes dated image posts, gradient text overlays, like and comment actions, a comment field, and a share option.</p>
    </td>
  </tr>
</table>

## Features

- Full-screen social profile layout
- Image-based profile header with dark gradient overlay
- Follow button, menu button, and profile edit actions
- Follower and following stat cards with stacked avatars
- Horizontal highlight section with add-highlight control
- Gallery grid with visual content counters
- Scrollable image post feed with likes, comments, and sharing UI

## Project Structure

```text
lib/
  main.dart       App entry point
  profile.dart    Social media profile screen
  sp.dart         Extra onboarding/splash UI experiment

assets/
  s1.png          Profile hero screenshot
  s2.png          Stats and highlights screenshot
  s3.png          Gallery screenshot
  s4.png          Post feed screenshot
```

## Getting Started

Make sure Flutter is installed, then run:

```bash
flutter pub get
flutter run
```

## Built With

- Flutter
- Dart
- Material Design widgets
- Local image assets

## Notes

This project is designed as a UI practice app for building a modern social media profile experience in Flutter.
