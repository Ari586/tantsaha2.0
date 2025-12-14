# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep SharedPreferences
-keep class android.content.SharedPreferences { *; }

# Keep JSON serialization classes
-keepattributes *Annotation*
-keepattributes Signature

# Prevent R8 from removing native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Play Core library (for deferred components)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
