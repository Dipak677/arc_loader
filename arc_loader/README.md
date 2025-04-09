# arc_loader

[![Pub Version](https://img.shields.io/pub/v/arc_loader.svg)](https://pub.dev/packages/arc_loader)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A customizable animated arc-shaped loader for Flutter. Supports multiple styles, speeds, colors, and arc configurations.

---

## 📸 Preview

| Simple Arc | Complete Arc |
|------------|--------------|
| ![Simple](https://raw.githubusercontent.com/Dipak677/arc_loader/refs/heads/main/simple_arc.gif) | ![Complete](https://raw.githubusercontent.com/Dipak677/arc_loader/refs/heads/main/complete_arc.gif) |

---

## ✨ Features

- 🔀 Beautiful arc-based loader animation
- 🎨 Custom colors, width, spacing, and speed
- 🔁 Continuous rotation animation
- 🧹 Two styles: Simple and Complete arcs

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  arc_loader: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 💡 Usage

```dart
import 'package:arc_loader/arc_loader.dart';

ArcLoader(
  arcColors: [Colors.blue, Colors.orange],
  arcWidth: 4.0,
  arcMargin: 8.0,
  innerGap: 2.0,
  speed: ArcSpeed.fast,
  style: ArcStyle.completeArc,
)
```

---

## 🎯 Available Options

| Property      | Type            | Description                                |
|---------------|------------------|--------------------------------------------|
| `arcColors`   | `List<Color>`    | Colors for each arc segment                |
| `arcWidth`    | `double`         | Width of the arc stroke                    |
| `arcMargin`   | `double`         | Margin from the edge of the container      |
| `innerGap`    | `double`         | Gap between outer and inner arcs           |
| `speed`       | `ArcSpeed`       | Rotation speed (`slow`, `medium`, `fast`)  |
| `style`       | `ArcStyle`       | Arc style (`simpleArc`, `completeArc`)     |

---



## 📄 License

This package is licensed under the MIT License. See the [LICENSE](https://opensource.org/license/mit) file for more information.