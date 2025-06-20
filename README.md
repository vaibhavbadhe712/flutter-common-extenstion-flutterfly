# Flutter Common Extensions

A comprehensive collection of useful Flutter extensions that make your development faster and code cleaner. This package includes extensions for Widget, String, DateTime, Color, List, Duration and more!

## Features

- **Size Extensions**: Easy SizedBox creation with numbers
- **String Extensions**: String manipulation and validation
- **DateTime Extensions**: Date formatting and manipulation  
- **Widget Extensions**: Common widget operations
- **Color Extensions**: Color manipulation and hex conversion
- **List Extensions**: Safe list operations
- **Duration Extensions**: Duration formatting and operations

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_common_extensions: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:flutter_common_extensions/flutter_common_extensions.dart';
```

### Size Extensions

Create SizedBox widgets easily:

```dart
// Height
20.height  // SizedBox(height: 20)
15.0.verticalSpace  // SizedBox(height: 15)

// Width  
30.width   // SizedBox(width: 30)
25.0.horizontalSpace  // SizedBox(width: 25)

// Both dimensions
50.box     // SizedBox(height: 50, width: 50)

// Padding
16.padding          // EdgeInsets.all(16)
20.paddingHorizontal // EdgeInsets.symmetric(horizontal: 20)
12.paddingVertical   // EdgeInsets.symmetric(vertical: 12)
8.paddingTop        // EdgeInsets.only(top: 8)

// Border Radius
12.borderRadius     // BorderRadius.circular(12)
8.topRadius        // BorderRadius only top corners
```

### String Extensions

Powerful string operations:

```dart
"hello world".capitalizeFirst()     // "Hello world"
"hello world".capitalizeEachWord()  // "Hello World"
"hello world".titleCase            // "Hello World"

// Validation
"test@email.com".isEmail          // true
"+1234567890".isPhoneNumber       // true
"https://google.com".isUrl        // true
"12345".isNumeric                 // true

// Conversion
"123".toInt        // 123 (int?)
"12.5".toDouble    // 12.5 (double?)

// Utilities
"Long text here".truncate(10)     // "Long text ..."
"  spaced  ".removeWhitespace     // "spaced"
"Hello World".reversed            // "dlroW olleH"
"Hello World".wordCount           // 2

// Null safety
String? nullableString = null;
nullableString.isNullOrEmpty      // true
nullableString.orEmpty           // ""
```

### DateTime Extensions

Comprehensive date operations:

```dart
DateTime now = DateTime.now();

// Formatting
now.formatDate        // "20/06/2025"
now.formatTime        // "14:30"
now.formatTime12      // "2:30 PM"
now.formatDateTime    // "20/06/2025 14:30"
now.dayName          // "Friday"
now.monthName        // "June"

// Checks
now.isToday          // true
now.isWeekend        // true/false
now.isWeekday        // true/false

// Relative time
now.timeAgo          // "Just now", "2 hours ago", etc.

// Date boundaries
now.startOfDay       // Today at 00:00:00
now.endOfDay         // Today at 23:59:59
now.startOfMonth     // First day of month
now.endOfMonth       // Last day of month

// Business days
now.addBusinessDays(5)  // Add 5 business days (skip weekends)

// String to DateTime
"2025-06-20".toDateTime           // DateTime?
"2025-06-20".toDateTimeOrDefault() // DateTime with fallback
```

### Widget Extensions

Make widget operations fluent:

```dart
Text("Hello")
  .paddingAll(16)
  .marginSymmetric(horizontal: 20)
  .center
  .card(elevation: 4)
  .onTap(() => print("Tapped!"));

// More examples
Container()
  .expanded
  .flexible(flex: 2)
  .visible(true)
  .opacity(0.8)
  .borderRadius(12)
  .safeArea;

// Gestures
MyWidget()
  .onTap(() => print("Tapped"))
  .inkWell(onTap: () => print("InkWell tapped"));

// Transformations
Icon(Icons.star)
  .rotate(0.5)
  .scale(1.5)
  .circular;

// Layout
Text("Positioned")
  .positioned(top: 10, left: 20)
  .align(Alignment.center);
```

### Color Extensions

Color manipulation made easy:

```dart
Color myColor = Colors.blue;

// Hex conversion
myColor.toHex              // "#2196F3"
"#FF5722".toColor         // Color from hex

// Color operations
myColor.lighten(0.2)      // Lighter shade
myColor.darken(0.3)       // Darker shade
myColor.complementary     // Complementary color

// Material color
myColor.toMaterialColor   // MaterialColor swatch
```

### List Extensions

Safe list operations:

```dart
List<String> items = ["a", "b", "c", "d"];

// Safe access
items.safeGet(10)         // null (instead of exception)
items.second             // "b"
items.third              // "c"
items.secondLast         // "c"

// Utilities
items.random             // Random element
items.unique             // Remove duplicates
items.chunk(2)           // [["a", "b"], ["c", "d"]]

// Null safety
List<String>? nullList = null;
nullList.isNullOrEmpty   // true
nullList.orEmpty         // []
```

### Duration Extensions

Duration operations:

```dart
Duration duration = Duration(hours: 2, minutes: 30, seconds: 45);

// Formatting
duration.formatDuration    // "02:30:45"
duration.humanReadable    // "2 hours"

// Easy creation
5.seconds                // Duration(seconds: 5)
10.minutes              // Duration(minutes: 10)
2.hours                 // Duration(hours: 2)
3.days                  // Duration(days: 3)

// Delay
await 2.seconds.delay;   // Wait for 2 seconds
```

## Complete Usage Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_common_extensions/flutter_common_extensions.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extensions Demo"),
      ),
      body: Column(
        children: [
          // Using size extensions
          20.height,
          
          // Using widget extensions
          Text("Welcome User".titleCase)
            .paddingAll(16)
            .card(elevation: 2)
            .marginSymmetric(horizontal: 20),
          
          // Using datetime extensions
          Text("Today: ${DateTime.now().formatDate}")
            .paddingVertical(8),
            
          Text("Time: ${DateTime.now().formatTime12}")
            .paddingVertical(8),
          
          // Using color extensions
          Container(
            width: 100,
            height: 100,
            color: "#FF5722".toColor.lighten(0.2),
          )
            .borderRadius(12)
            .center
            .paddingAll(20),
          
          // Using string extensions
          Text("john.doe@email.com".isEmail ? "Valid Email" : "Invalid Email")
            .paddingAll(8),
          
          // Button with extensions
          ElevatedButton(
            onPressed: () async {
              // Using duration extensions
              await 1.seconds.delay;
              print("Button pressed after delay!");
            },
            child: Text("Click Me"),
          )
            .paddingAll(16)
            .center,
            
          Spacer(),
          
          // Footer with multiple extensions
          Text("Made with Flutter Common Extensions")
            .opacity(0.7)
            .paddingAll(16)
            .center,
        ],
      ),
    );
  }
}
```

## Package Structure

```
lib/
├── flutter_common_extensions.dart    # Main export file
└── src/
    ├── size_extensions.dart          # SizedBox, Padding, Margin, BorderRadius
    ├── string_extensions.dart        # String operations and validations
    ├── datetime_extensions.dart      # Date and time utilities
    ├── widget_extensions.dart        # Widget manipulation methods
    ├── color_extensions.dart         # Color operations and hex conversion
    ├── list_extensions.dart          # List utilities and safe operations
    └── duration_extensions.dart      # Duration formatting and operations
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Extensions Overview

### Size Extensions
- `num.height` - Creates SizedBox with height
- `num.width` - Creates SizedBox with width
- `num.padding` - Creates EdgeInsets padding
- `num.borderRadius` - Creates BorderRadius

### String Extensions
- `capitalizeFirst()` - Capitalize first letter
- `titleCase` - Title case conversion
- `isEmail` - Email validation
- `isPhoneNumber` - Phone validation
- `truncate()` - Text truncation
- `wordCount` - Count words

### DateTime Extensions
- `formatDate` - Format as dd/MM/yyyy
- `formatTime` - Format as HH:mm
- `isToday` - Check if today
- `timeAgo` - Relative time
- `addBusinessDays()` - Add business days

### Widget Extensions
- `paddingAll()` - Add padding
- `center` - Center widget
- `onTap()` - Add tap gesture
- `card()` - Wrap in card
- `borderRadius()` - Add border radius
- `opacity()` - Set opacity

### Color Extensions
- `toHex` - Convert to hex string
- `lighten()` - Lighten color
- `darken()` - Darken color
- `complementary` - Get complementary color

### List Extensions
- `safeGet()` - Safe element access
- `random` - Get random element
- `unique` - Remove duplicates
- `chunk()` - Split into chunks

### Duration Extensions
- `formatDuration` - Format as HH:MM:SS
- `humanReadable` - Human readable format
- `delay` - Async delay
- `int.seconds` - Create duration from int

## Performance

All extensions are optimized for performance:
- No unnecessary object creation
- Efficient string operations
- Null-safe implementations
- Memory-conscious list operations

## Requirements

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0
- intl: ^0.19.0

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

### 1.0.0
- Initial release
- Size extensions for SizedBox, Padding, Margin
- String extensions with validation and formatting
- DateTime extensions with comprehensive formatting
- Widget extensions for common operations
- Color extensions with hex support
- List extensions with safe operations
- Duration extensions with formatting

## Support

If you find this package helpful, please consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting new features
- 🤝 Contributing to the codebase

For questions and support, please open an issue on GitHub.

---

**Happy Coding with Flutter Common Extensions! 🚀**