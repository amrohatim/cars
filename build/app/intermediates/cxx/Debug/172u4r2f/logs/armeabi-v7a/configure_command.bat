@echo off
"C:\\Users\\Admin\\AppData\\Local\\Android\\Sdk\\cmake\\3.18.1\\bin\\cmake.exe" ^
  "-HC:\\Flutter and Dart\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\groovy" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=22" ^
  "-DANDROID_PLATFORM=android-22" ^
  "-DANDROID_ABI=armeabi-v7a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a" ^
  "-DANDROID_NDK=C:\\Users\\Admin\\AppData\\Local\\Android\\Sdk\\ndk\\26.3.11579264" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\Admin\\AppData\\Local\\Android\\Sdk\\ndk\\26.3.11579264" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\Admin\\AppData\\Local\\Android\\Sdk\\ndk\\26.3.11579264\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\Admin\\AppData\\Local\\Android\\Sdk\\cmake\\3.18.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=C:\\Users\\Admin\\Desktop\\fff\\build\\app\\intermediates\\cxx\\Debug\\172u4r2f\\obj\\armeabi-v7a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=C:\\Users\\Admin\\Desktop\\fff\\build\\app\\intermediates\\cxx\\Debug\\172u4r2f\\obj\\armeabi-v7a" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BC:\\Users\\Admin\\Desktop\\fff\\android\\app\\.cxx\\Debug\\172u4r2f\\armeabi-v7a" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli
