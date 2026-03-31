# SETUP:

In roughly this order:

 - https://docs.flutter.dev/install/manual
 - https://docs.flutter.dev/platform-integration/android/setup
 - https://developer.android.com/studio/index.html
 - https://stackoverflow.com/questions/68236007/i-am-getting-error-cmdline-tools-component-is-missing-after-installing-flutter
  -https://stackoverflow.com/questions/63167588/how-to-change-the-api-sdk-version-of-my-flutter-android-app
  
A restart was needed too. FFS.

Note that on first run, in VS Code the packages cannot be found. This seems to be because some internal metadata that is generated on first CLI run is not present:

 - if you navigate to the app via CLI, then run `flutter run`, observe in VSC that the 'broken' packages will all disappear as the CLI command progresses.
  

I kept going round in circles because of this error:

```
[✓] Flutter (Channel stable, 3.38.4, on Ubuntu 22.04.5 LTS 6.8.0-87-generic, locale en_GB.UTF-8)
[✗] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
      Install Android Studio from: https://developer.android.com/studio/index.html
      On first launch it will assist you in installing the Android SDK components.
      (or visit https://flutter.dev/to/linux-android-setup for detailed instructions).
      If the Android SDK has been installed to a custom location, please use
      `flutter config --android-sdk` to update to that location.

[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 1 category.
```


```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.4, on Ubuntu 22.04.5 LTS 6.8.0-87-generic, locale en_GB.UTF-8)
[✗] Android toolchain - develop for Android devices
    ✗ cmdline-tools component is missing.
      Try installing or updating Android Studio.
      Alternatively, download the tools from https://developer.android.com/studio#command-line-tools-only and make sure to set the
      ANDROID_HOME environment variable.
      See https://developer.android.com/studio/command-line for more details.
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Connected device (2 available)
[✓] Network resources

```

and 

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.4, on Ubuntu 22.04.5 LTS 6.8.0-87-generic, locale en_GB.UTF-8)
[!] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
    ✗ cmdline-tools component is missing.
      Try installing or updating Android Studio.
      Alternatively, download the tools from https://developer.android.com/studio#command-line-tools-only and make sure to set the
      ANDROID_HOME environment variable.
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/to/linux-android-setup for more details.
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Connected device (2 available)
    ! Device R9TR30RTCDJ is not authorized.
      You might need to check your device for an authorization dialog.
[✓] Network resources
```


Downloaded and extracted Android Studio here. Ran via the binary, and finally found the fourth SO ref about fixing the missing 'cmdline-tools is missing' error.

Finally, accept the androide licences as indicated:

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.4, on Ubuntu 22.04.5 LTS 6.8.0-87-generic, locale en_GB.UTF-8)
[!] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Connected device (2 available)
    ! Device R9TR30RTCDJ is not authorized.
      You might need to check your device for an authorization dialog.
[✓] Network resources

! Doctor found issues in 1 category.
```


and then:

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.38.4, on Ubuntu 22.04.5 LTS 6.8.0-87-generic, locale en_GB.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.1.0)
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Connected device (2 available)
    ! Device R9TR30RTCDJ is not authorized.
      You might need to check your device for an authorization dialog.
[✓] Network resources

• No issues found!

```



cmd list:

```
  400  rm -rf ~/Android
  401  rm -rf ~/AndroidStudioProjects (only if you did not make any projects here)
  402  rm -rf ~/.cache/Android\ Open\ Source\ Project
  403  rm -rf ~/.cache/Google
  404  rm -rf ~/.config/Android\ Open\ Source\ Project
  405  rm -rf ~/.config/Google
  406  rm -rf ~/.local/share/Android\ Open\ Source\ Project
  407  rm -rf ~/.local/share/Google
  408  rm -rf ~/.local/share/android-studio (or any directory of your choice to install)
  409  rm -rf ~/.local/share/android-studio
  410  rm -rf ~/Android
  411  rm -rf ~/AndroidStudioProjects (only if you did not make any projects here)
  412  rm -rf ~/.cache/Android\ Open\ Source\ Project
  413  rm -rf ~/.cache/Google
  414  rm -rf ~/.config/Android\ Open\ Source\ Project
  415  rm -rf ~/.config/Google
  416  rm -rf ~/.local/share/Android\ Open\ Source\ Project
  417  rm -rf ~/.local/share/Google
  418  rm -rf ~/.local/share/android-studio
  419  rm -rf ~/Android
  420  rm -rf ~/AndroidStudioProjects
  421  rm -rf ~/.cache/Android\ Open\ Source\ Project
  422  rm -rf ~/.cache/Google
  423  rm -rf ~/.config/Android\ Open\ Source\ Project
  424  rm -rf ~/.config/Google
  425  rm -rf ~/.local/share/Android\ Open\ Source\ Project
  426  rm -rf ~/.local/share/Google
  427  rm -rf ~/.local/share/android-studio
  428  rm -rf ~/.android
  429  flutter doctor
  430  sudo apt-get update -y && sudo apt-get upgrade -y
  431  sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
  432  flutter doctor
  433  sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
  434  flutter doctor
  435  flutter config --android-sdk
  436  flutter config --android-sdk -h
  437  flutter config --android-sdk ~/Android/Sdk
  438  flutter config
  439  flutter config --list
  440  flutter doctor
  441  history
```

Finally, MAKE SURE to install the correct android version SDK (from Android Studio) for the phone/tablet!!!!!!!! WILL NOT WORK otherwise

[to transfer to dev machine!!]

# ch 1 Intro

 - OK
 
# Ch 2 deployment (windows)

 - Androoid Studio (but ref G4G Flutter tutorial, using VSCode!! - [here](https://www.geeksforgeeks.org/flutter/flutter-development-in-ubuntu-20-04/))
 - Windows
 - MacOS
 
 He actually uses VS Code anyway...
 
 [note: I installed with snap - /usr/bin/flutter for binary, /home/silas/snap/flutter/common/flutter for the dev kit
 
 Some useful stuff re setting up virtual devices
 
# Ch 3 deployment (mac)

 - um...
 
 08:29
 
# ch 4 VS Code

## install

 - install flutter extension
 - also recommends "pubspec assist" extension!!
 
## Create flutter project 

 - my examplke folder
 
`$ flutter create [projectname]`

Alt way of starting project with VS Code:

 - in cli, open created project,
 
 `$ code .`
 
 TADA!



- **Flutter site** recommends using VSCode (NOT Android IDE)

[you need a lot of grunt to run the emulators!!]

therefore:

```
silas@silas-Latitude-E6520:/media/silas/Data/Dev/Flutter_tests/hello_world$ flutter devices
Found 3 connected devices:
  SM G930F (mobile) • ce0117118d08e82c0c • android-arm64  • Android 8.0.0 (API 26)
  Linux (desktop)   • linux              • linux-x64      • Ubuntu 22.04.5 LTS 6.8.0-85-generic
  Chrome (web)      • chrome             • web-javascript • Google Chrome 141.0.7390.54

Run "flutter emulators" to list and start any available device emulators.

If you expected another device to be detected, please run "flutter doctor" to diagnose potential issues. You may also try
increasing the time to wait for connected devices with the "--device-timeout" flag. Visit https://flutter.dev/setup/ for
troubleshooting tips.
silas@silas-Latitude-E6520:/media/silas/Data/Dev/Flutter_tests/hello_world$ flutter run -d ce0117118d08e82c0c
```

This is for my S7

NOTE: The generic emulator fails to start:

$ flutter run -d emulator-5554
No supported devices found with name or id matching 'emulator-5554'.

The following devices were found:
SM G930F (mobile) • ce0117118d08e82c0c • android-arm64  • Android 8.0.0 (API 26)
Linux (desktop)   • linux              • linux-x64      • Ubuntu 22.04.5 LTS 6.8.0-85-generic
Chrome (web)      • chrome             • web-javascript • Google Chrome 141.0.7390.54

## BUT:

$ flutter emulators
2 available emulators:

Id                    • Name                  • Manufacturer • Platform

Medium_Phone_API_36.1 • Medium Phone API 36.1 • Generic      • android
Small_Phone           • Small Phone           • Generic      • android

 - He did note about underscores - but didn't make it clear that this meant when calling an emulator!!!!
 
Doesn't fucking work anyway!!:

$ flutter emulators
2 available emulators:

Id                    • Name                  • Manufacturer • Platform

Medium_Phone_API_36.1 • Medium Phone API 36.1 • Generic      • android
Small_Phone           • Small Phone           • Generic      • android

To run an emulator, run 'flutter emulators --launch <emulator id>'.
To create a new emulator, run 'flutter emulators --create [--name xyz]'.

You can find more information on managing emulators at the links below:
  https://developer.android.com/studio/run/managing-avds
  https://developer.android.com/studio/command-line/avdmanager

and:

flutter emulators --launch Small_Phone

This WILL launch the emulator, but flutter cannot see it...

THIS IS WHY:
https://stackoverflow.com/questions/79736526/im-unable-to-run-my-flutter-app-on-emulator-in-vscode-says-unsupported-emulato

(but works OK for physical phone!)




# Ch 5 why flutter

 - write once, deploy anywhere (mostly)...- 
 - one language (not 5... Java/Kotlin/ObjectiveC/XML etc. depending on platform)
 
# Ch6 example app from scratch!


`$ flutter create fortune_cookie`


random vs sequential, - basic string and index etc... :-/

the `this.` keyword may be optional if not ambiguous!

## basics

strings, vars etc...


https://dartpad.dev/

 - a scratchpad...

entrypoint is always 
```
void main(){  // the entrypoint
}
```

OK - so `var` is dynamically typed (like javascript) so this works:

var x = 12;
print(x.runtimeType);
x="something else";
print(x.runtimeType);


but this fails

int x = 12;
print(x.runtimeType);
x="something else";
print(x.runtimeType);

# from scratchpad:

Note ref. The stuff about var vs dynamic is a bit odd. UNassigned var is actually dynamic...

void main() {
  /// A test function!
  var sausage = "BANGER";
  var numSausages = 18;

  // https://stackoverflow.com/questions/12416507/difference-between-var-and-dynamic-type-in-dart
  var x; //actually dynamic
  x = 12;
  print("${x.runtimeType} ($x)");
  x = "something else";
  print("${x.runtimeType} ($x)");

  var x2 = 12; //explicitly assigned...
  print("${x2.runtimeType} ($x2)");
  x2 = "something else"; //...this now FAILS
  print("${x2.runtimeType} ($x2)");

  // to concatenate, we can either use interpolation (with {}) or use a $ prefix within the string:
  print('$sausage count=$numSausages');
  print('${sausage} count=${numSausages}');

  // but this fails (doesn't catch either)
  // but see https://stackoverflow.com/questions/69393497/what-is-typeerror-and-how-to-handle-test-it
  //   try {
  //     int y;
  //     y = 12;
  //     print(y.runtimeType);
  //     y = "something else";
  //     print(y.runtimeType);
  //   } on TypeError catch (e) {
  //     print(e.runtimeType);
  //     print(e.toString());
  //   }

  print(numSausages.runtimeType);
  //   for (var i = 0; i < 10; i++) {
  //     print('hello ${i + 1}');
  //   }
}

## functions

entry point is void main(){}

functions
function return types
function ARGs (see weirdness at void sayShit(var shit) {)


# Adds more basic syntax stuff. Note I was exploring the optional args part, so there is more here...

void main() {
  print(sayShit());

  // and with a param:
  print(sayShit("SHITTY!!")); // here, the null defailt value is strinified to 'null'

  // and with two params:
  print(sayShit("SHITTY!!", 123));
}

// https://dart.dev/language/functions#named-parameters
// https://stackoverflow.com/questions/65859725/functions-with-optional-parameter-dart
// which of the above is the 'preferred' usage??
// void sayShit(var shit) {
// https://dart.dev/language/functions#optional-positional-parameters
// its actually square brackets
String sayShit([String shit = "", int? bob]) {
  String out = "";
  // optional parameter with default. Second syntax implies null as default - which is counter to typing...
  /// A test function!
  var sausage = "BANGER";

  // NOTE: CANNOT do this:
  //   String shit = shit;

  //if(shit.length > 0){ // note: a string does NOT imply true
  if (shit.isNotEmpty) {
    // preferred
    // $ will coerce types
//     print("We have $bob shit! $shit!");
    out += "We have $bob shit! $shit!\n";
  }

  int numSausages = getSausageCount();
  numSausages++; // works as expected
  numSausages += 12; // ALSO works!!

//   print('$sausage (from func) count=$numSausages');
//   print('${sausage} (from func) count=${numSausages}');
    out += '$sausage (from func) count=$numSausages\n';
    out += '${sausage} (from func) count=${numSausages}\n';
  
  
  // https://stackoverflow.com/questions/12416507/difference-between-var-and-dynamic-type-in-dart
  var x; //actually dynamic
  x = 12;
  print(
    "${x.runtimeType} ($x)",
  ); // note difference in curly braces when a (slightly) more complex expression!
  x = "something else";
//   print("${x.runtimeType} ($x)");
  out += "${x.runtimeType} ($x)";

  //   var x2 = 12; //explicitly assigned...
  //   print("${x2.runtimeType} ($x2)");
  //   x2 = "something else"; //...this now FAILS
  //   print("${x2.runtimeType} ($x2)");

  // but this fails (doesn't catch either)
  // but see https://stackoverflow.com/questions/69393497/what-is-typeerror-and-how-to-handle-test-it
  //   try {
  //     int y;
  //     y = 12;
  //     print(y.runtimeType);
  //     y = "something else";
  //     print(y.runtimeType);
  //   } on TypeError catch (e) {
  //     print(e.runtimeType);
  //     print(e.toString());
  //   }

  //   for (var i = 0; i < 10; i++) {
  //     print('hello ${i + 1}');
  //   }

//   print("Hello to $x!");
  out += "Hello to $x";
  // and a return value:
  return out;
}

int getSausageCount() {
  int ns = 18;
  // to concatenate, we can either use interpolation (with {}) or use a $ prefix within the string:

  print(ns.runtimeType);
  return (ns); // brackets are optional (preferred?)
}


# CLI args for Flutter control (to sort)

  625  sudo snap install flutter --classic
  626  flutter --version
  627  dart --version
  628  sudo apt install openjdk-11-jdk
  629  sudo snap install android-studio --classic
  630  cd dev
  631  ls
  632  exit
  633  flutter run
  634  flutter devices
  635  flutter emulators
  636  flutter devices
  637  flutter doctor --android-licenses
  638  flutter devices
  639  flutter doctor
  640  flutter devices
  641  flutter run --help
  642  flutter run -d R5CX216JD4X
  643  cd media
  644  cd mount/
  645  ls
  646  cd /mnt/
  647  ls
  648  cd data
  649  ls
  650  $PASTH
  651  $PATH
  652  flutter
  653  flutter help -v
  654  flutter --packages
  655  flutter -d --packages
  656  flutter doctor
  657  which flutter
  658  flutter doctor --android-licenses
  659  flutter doctor
  660  flutter devices
  661  vscode .
  662  code .
  663  flutter devices
  664  flutter run -d ce0117118d08e82c0c
  665  flutter devices
  666  flutter run -d emulator-5554
  667  flutter run -d "emulator-5554"
  668  flutter run -d emulator-5554
  669  flutter run -d Android\ SDK\ built\ for\ x86
  670  flutter devices
  671  flutter run -d Android\ SDK\ built\ for\ x86
  672  flutter run -d Android\ SDK\ built\ for\ x86\ (mobile)
  673  flutter devices
  674  flutter emulators
  675  flutter run -d emulator-5554
  676  flutter run -d Small_Phone
  677  flutter run --launch emulator-5554
  678  flutter emulators --launch Small_Phone
  679  flutter run -d Small_Phone
  680  flutter devices
  681  flutter run -d emulator-5554
  682  flutter run -d emulator_5554
  683  flutter config
  684  flutter config --android-sdk
  685  flutter config --android-sdk /home/silas/Android/Sdk
  686  flutter run -d emulator-5554
  687  exit
  688  flutter run -d emulator-5554
  689  flutter emulators
  690  flutter devices
  691  flutter run -d emulator-5554
  692  cd .
  693  cd ..
  694  flutter create fortune_cookie 
  695  cd fortune_cookie/
  696  flutter run
       flutter create --platforms=linux,windows .
  697  history


# 5: Adding a Card, and intro to Widgets

add to assets/images

need an entry in pubspec.yml (can this be a wildcard??)

5.10 - images
 - add asset folder to root

# 6: widgets deep dive

## stateless

only rebuilt if PARENT changes (e.g. orientation etc.)

## stateful

has a State object with mutable props - setState()...

THIS:

https://www.tops-int.com/blog/mastering-stateless-and-stateful-widgets-in-flutter

 - meaning the ENTIRE app is itself the stateful widget! (e.g. the counter demo before I added crap to it...)
 - as an aside to this, https://www.tops-int.com/blog/mastering-stateless-and-stateful-widgets-in-flutter ALSO describes how you would write your own widgets classes!

 - the above is key as it has explanation of WTF is going on with the demo app core structure.

# 6.2 widget hierarchy


what happens if I call setState without a callback??

 - nope
 - It also seems like a double call to setState() in a function will only trigger a single update (wchih makes sense I guess)
 
# 6.4 `const` keyword 

# 6.5 Tip Calculator app

 - intro
 
# 6.6 UTip app
 
alternate way to create a flutter project (not `flutter create xxx`):
  - ia context menu in VS Code...
  
 - he creates a scaffolded app, but then deletes the homepage generated widget (to provide an exampkle of doing it manually):
 - actually he demos using autocomplete in VSCode...:
 In the main.dart code:
 
 stl 9autocomplete to show options for creating a stateful or stateless widget
 
# 6.7 adding the TPP widget

# 6.8 adding a container
  [he uses ctrl + . to trigger the quick fix (i.e. wrap with code). This is problematic for me (probably bound elsewhere - see https://stackoverflow.com/questions/58946149/how-to-troubleshoot-some-shortcuts-not-working-properly-in-vscode) so I re-bound to 'ctrl + shift + q' - for 'quick fix']
  
# 6.9 widget catalogue, themes

https://docs.flutter.dev/ui/widgets

 - The Text() can be sttyled independently with its own internal properties, BUT, we can use a Theme for consistency:
 
CONTEXT (is BuildContext, ):
 - widget location in tree - gets nearest theme...

# 6.10 OOP dart

widgets are instances of Dart classes...
 - basics of classes. Theres a few oddities:
 - See notes on scratchpad.dart in UTIP
 
# 6.11 refactor and finalizing top widget

 - back to main.dart:
 - uses the theme concept to have a - er - consistent theme.
 
# 6.12 Bill amt frame

 - first, adds a border to the Column (I think I did this earlier)
 - see https://stackoverflow.com/questions/68675718/how-can-i-catch-event-when-a-text-field-is-exiting-focus-on-blur-in-flutter
 to better handle the processing of the data in one go, ratherthan onChange.
 
# 6.13 'Split Bill' section 

 - he defaults to applying a `const` to everything, and then removing as needed. Is this best practice?
 
# 6.14 inc/dev function

 - this bit I could not work out for myself. There is some weird scope thing going on...
 - I'd put the property and methods inside the build function...
 
# 6.15 refactor/tidy

 - in VS Code 'extract widget' from quick-fix menu:
 
#6.17 widget abstraction.

 - IN VS Code, the option to 'extract to widget' via the quick fix menu:
 
from this (inline):

```
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split bill by:",
                        style: theme.textTheme.titleMedium,		// 5
                      ),						// 6
                      Row(
                        children: [
                          IconButton(
                            color: theme.colorScheme.primary,		// 10
                            onPressed: decrementCounter,
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            "$personCount",				// 15
                            style: theme.textTheme.titleMedium,
                          ),
                          IconButton(
                            color: theme.colorScheme.primary,
                            onPressed: incrementCounter,		// 20
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),							// 26
```

to this (abstracted widget):
 
```

import 'package:flutter/material.dart';


// This really does not have state, but DOES require arguments to this constructor of the methods (no params...)
class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,				// this is what?
    required this.theme,
    required this.personCount,
    required this.onDecrement,
    required this.onIncrement,
  });

  final ThemeData theme;
  final int personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
  
    // This bit is the source code that will be returned by a Widget - i.e. it is the code that was abstracted out
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Split bill by:", 
          style: theme.textTheme.titleMedium	// 5
        ),					// 6
        Row(
          children: [
            IconButton(				
              color: theme.colorScheme.primary,	// 10
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
            ),
            Text(
              "$personCount", 			// 15
              style: theme.textTheme.titleMedium
            ),
            IconButton(
              color: theme.colorScheme.primary,
              onPressed: onIncrement,		// 20
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );						// 26
    
    
  }
}
``` 


# 6:18 tip percentage and slider

 - see code notes - is WIP (the actual bill price is not yet implemented!)
 
# 6.19 positional vs. named args 

Some info on how to declare named params. I alos looked up how to provide optional named params.  This was for the class constructor, lets see if it is the same for function args...

# 6.20 - refactor tip slider 

Extract to widget. I have already used a method call (rather than inline...) so lets try this.

Why does his work with no sliderPos??? - it doesn't.
 - I need to figure out why he uses 2 variables for the slider, but I am uisng 3 - and they are all needed... TODO:
 
# 6.21 - refactor bill amt field

 - first extract to a Widget
 - see notes on code


11/11/25
-------- 
# 6.22 - tip conversion logic

 - I did most of this yesterday. lets check his version.... 
 - a little bit of logical alteration (dont have zero guests for example...) and also some placing of
   vars in slightly different scope to my stuff (see notes on code). I still need him to be more 
   detailed in his descriptions.
 - I need to handle divide by zero if slider is at zero - probably just wait for it to be > zero.
 - the calcs are not right. 
 - They are now.
 - all logic added. Now to see how to do it properly...
 - OK - I forgot. I need to ADD the total tip to the main bill - so we ADD the tip value to the final total...
 - and fix the hardcoded $ sign to a Sterling symbol.  OK, BUT I want to make the string/Icon adaptive to locale, ideally. Tried, but did not work :-(
 
# 6.23 - full refactor of widget

 - start with TPP section
 - he refactors to a new widget, and also refactors the Text above PersonCounter into the personcounter.
 
 
# Section 7: State management

12/11/25

NOTE:
 - an underscore ENFORCES local (to the physical file?)
 - https://stackoverflow.com/questions/53142171/what-does-underscore-before-variable-name-mean-for-flutter
 - note the comment about the private State override - this therefore becomes only available to the enclosing widget/class

# 7.1 Provider State Management Package

1: setState((){}); is the most basic way of doing it, but OK for simple apps.
 - he focuses on Provider (built-in) state management package
 - a Provider instance attaches to a TREE OF WIDGETS (e.g. the entire app, or a specific route etc.) and manages all stateful variables within that tree...
 - key point here is that - in addition to centralising the var state management, the Provider ALSO marshals redraw of ONLY the changed widget - NOT the entire UI
 - aids scalability and maintainability too because centralised, rather than having setState() scattered throughout the codebase.
 e.g. `Provider.of(varname)`
 
 revert to Fortune Cookie app.
 lets refactor to put everything into the one repo.


# 7.2 - counter_provider (new app, need to make another repo... - see https://docs.github.com/en/get-started/git-basics/managing-remote-repositories)

He creates a new app, then removes most of the code in Main.

It will be a version of counter app, but usimng a Provider for state management

The Provider package needs to be imported, and added to `pubspec.yml`:

ways of importing:
 - 1 terminal:
 
 $ flutter pub add <package_name>
 $ flutter pub add provider
 
  - see https://pub.dev/
    https://pub.dev/packages - lists all

 - so how do you know which one to use - 'state management' returned 2385 packages...
 - and the package in question 'provider' is NO LONGER listed in he favourites block


# 7.3 - provider is implemented with a class to hold the vars:

 - create a folder in project at /lib/providers
 - this contains Models for the state vars - e.g. CouterModel.dart (why the change in naming convention?)
 
   - he states that the filename is the classname? But I'm sure when we abstracted the widgets - also Classes of course - he used snake_case...  WTF?
 

 This:
 
 import 'package:flutter/material.dart';

class Countermodel extends ChangeNotifier {
  // this will be the central repository for state management for widget(s)
  // it will eventually only cause a redraw on the subscribing widget(s)

  // declare the private var to hold the counter value:
  int _counter = 0;

  // we need a getter:
  int getCounter() {
    return _counter;
  }

  // or:
  // is `counter` visible? well yes, but is it this that is being consumed? TO FIND OUT...
  int get counter => _counter;

  void setCounter() {
    // he calls this increment(){}
    _counter++;

    // a notification is needed if this happens, to notify any consumers:
    // (inherited from ChangeNotifier)
    notifyListeners();
    // this notification will then trigger the consumer/listener widgets
    // to rebuild - and of course render the updated variable
  }
}

needs to be registered in the consuming code (main.dart in this case):

[Also - to fix the garish theme (because no scaffold), wrap in a Scaffold]
 
MyApp needs to know about the provider... 

Essentially, the main MyApp root of widget hierarchy must be wrapped in the ChangeNotifierProvider widget:

SEE THIS:
https://blog.stackademic.com/a-complete-guide-to-using-changenotifier-and-changenotifierprovider-in-flutter-00f957819cf3
 - and this appears to be th esource of the tutorial too... 

13/11/25
--------

# 7.4 Consumer() vs. Provider.Of() overview

 - TODO - make repo for counter_provider!

$ git remote add origin git@github.com:sjewitt/counter_provider.git
$ git remote set-url origin git@github.com:sjewitt/counter_provider.git 
$ git remote -v (you can create ssh URLs up-front)

ARGH!! This only adds a LOCAL REF:
 - https://stackoverflow.com/questions/64889837/git-remote-add-doesnt-create-repo
 
FFS!!
list create in GH
https://github.com/orgs/community/discussions/141435
 - and this doesn't fucking work either!
https://github.com/orgs/community/discussions/179038
 - well this fucking sucks
 
 
Consumer(); and Provider.of(); do similar jobs, but:

 -  are both listeners for Provider state mgmnt

 - Consumer() is focused on rebuilding part of widget tree - see counter_provider, main.dart, where used as wrapper for column, and has a Builder as direct child that contains the widget tree - and thus can rebuild that widget tree when a state has changed that is relevant to that branch. (There is still lack of clarity around the singleton - or otherwise - state of the Counterprovider instance(s))

 - Provider.of() is a way to access provided state directly - does NOT trigger a rebuild. Therefore, for cases where we need to rebuild the UI (rather than just use the variable) we need to manually call the build() method - EXAMPLE???
 

# 7.4 Comparing Consumer() and Provider.of() 

 - create new branch of fortune cookie app:
 - This will be a full example of Provider, but in a single main.dart file.
   - this may be fiddly, as I fairly extensively buggered about with the code...
 - remove all inline code comments (they are in the history now of course)
 - the setState() stuff will be replaced by a Provider()

## extends vs with vs implements

see https://www.geeksforgeeks.org/dart/dart-extends-vs-with-vs-implements/
 
   - extends - class B can use all methods of class A - does not need to (but CAN) re-implement them
   - implements - forces class A (superclass) to be treated like an interface - i.e. all methods in class A MUST be reimplemented (with @implements decorator)
   - with - uses `mixin` rather than `class` to define an abstract class? Can be used for multiple inheritance (which class A extends/implements class B cannot):
   
   
```
// mixin with name First
mixin First {
    void firstFunc() {
        print('hello');
    }
}

// mixin with name temp
mixin temp {
    void number() {
        print(10);
    }
}

// mixin type used with keyword
class Second with First, temp {
    @override
    void firstFunc() {
        print('can override if needed');
    }
}

void main() {
    var second = Second();
    second.firstFunc();
    second.number();
}
```   

but looking at the countrer_provider code, it also looks like a Mixin class B can be used with `implements` as well.

    ASIDE: [ctrl]+[-]/[+] to change font size in VS code
    
There is something funky about the Context. It needs to be teh CORRECT context:

```
════════ Exception caught by widgets library ═══════════════════════════════════
The following ProviderNotFoundException was thrown building Consumer<FortuneModel>(dirty):
Error: Could not find the correct Provider<FortuneModel> above this Consumer<FortuneModel> Widget

This happens because you used a `BuildContext` that does not include the provider
of your choice. There are a few common scenarios:

- You added a new provider in your `main.dart` and performed a hot-reload.
  To fix, perform a hot-restart.

- The provider you are trying to read is in a different route.

  Providers are "scoped". So if you insert of provider inside a route, then
  other routes will not be able to access that provider.

- You used a `BuildContext` that is an ancestor of the provider you are trying to read.

  Make sure that Consumer<FortuneModel> is under your MultiProvider/Provider<FortuneModel>.
  This usually happens when you are creating a provider and trying to read it immediately.

  For example, instead of:

  ```
  Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // Will throw a ProviderNotFoundError, because `context` is associated
      // to the widget that is the parent of `Provider<Example>`
      child: Text(context.watch<Example>().toString()),
    );
  }
  ```

  consider using `builder` like so:

  ```
  Widget build(BuildContext context) {
    return Provider<Example>(
      create: (_) => Example(),
      // we use `builder` to obtain a new `BuildContext` that has access to the provider
      builder: (context, child) {
        // No longer throws
        return Text(context.watch<Example>().toString());
      }
    );
  }

The relevant error-causing widget was:
    Consumer<FortuneModel> Consumer:file:///media/silas/Data/Dev/Flutter_tests/fortune_cookie/lib/main.dart:67:13

When the exception was thrown, this was the stack:
#0      Provider._inheritedElementOf (package:provider/src/provider.dart:377:7)
provider.dart:377
#1      Provider.of (package:provider/src/provider.dart:327:30)
provider.dart:327
#2      Consumer.buildWithChild (package:provider/src/consumer.dart:181:16)
#3      SingleChildStatelessWidget.build (package:nested/nested.dart:259:41)
nested.dart:259
#4      StatelessElement.build (package:flutter/src/widgets/framework.dart:5791:49)
framework.dart:5791
#5      SingleChildStatelessElement.build (package:nested/nested.dart:279:18)
nested.dart:279
#6      ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5723:15)
framework.dart:5723
#7      Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
framework.dart:5435
#8      ComponentElement._firstBuild (package:flutter/src/widgets/framework.dart:5705:5)
framework.dart:5705
#9      ComponentElement.mount (package:flutter/src/widgets/framework.dart:5699:5)
framework.dart:5699
#10     SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
nested.dart:222
#11     Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
framework.dart:4548
#12     MultiChildRenderObjectElement.inflateWidget (package:flutter/src/widgets/framework.dart:7169:36)
framework.dart:7169
#13     MultiChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:7185:32)
framework.dart:7185
...     Normal element mounting (28 frames)
#41     Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
framework.dart:4548
#42     MultiChildRenderObjectElement.inflateWidget (package:flutter/src/widgets/framework.dart:7169:36)
framework.dart:7169
#43     MultiChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:7185:32)
framework.dart:7185
...     Normal element mounting (340 frames)
#383    Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
framework.dart:4548
#384    MultiChildRenderObjectElement.inflateWidget (package:flutter/src/widgets/framework.dart:7169:36)
framework.dart:7169
#385    MultiChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:7185:32)
framework.dart:7185
...     Normal element mounting (477 frames)
#862    _InheritedProviderScopeElement.mount (package:provider/src/inherited_provider.dart:424:11)
inherited_provider.dart:424
...     Normal element mounting (7 frames)
#869    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
nested.dart:222
...     Normal element mounting (63 frames)
#932    Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
framework.dart:4548
#933    Element.updateChild (package:flutter/src/widgets/framework.dart:4004:18)
framework.dart:4004
#934    _RawViewElement._updateChild (package:flutter/src/widgets/view.dart:481:16)
view.dart:481
#935    _RawViewElement.mount (package:flutter/src/widgets/view.dart:504:5)
view.dart:504
...     Normal element mounting (15 frames)
#950    Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
framework.dart:4548
#951    Element.updateChild (package:flutter/src/widgets/framework.dart:4004:18)
framework.dart:4004
#952    RootElement._rebuild (package:flutter/src/widgets/binding.dart:1716:16)
binding.dart:1716
#953    RootElement.mount (package:flutter/src/widgets/binding.dart:1685:5)
binding.dart:1685
#954    RootWidget.attach.<anonymous closure> (package:flutter/src/widgets/binding.dart:1638:18)
binding.dart:1638
#955    BuildOwner.buildScope (package:flutter/src/widgets/framework.dart:3046:19)
framework.dart:3046
#956    RootWidget.attach (package:flutter/src/widgets/binding.dart:1637:13)
binding.dart:1637
#957    WidgetsBinding.attachToBuildOwner (package:flutter/src/widgets/binding.dart:1376:27)
binding.dart:1376
#958    WidgetsBinding.attachRootWidget (package:flutter/src/widgets/binding.dart:1361:5)
binding.dart:1361
#959    WidgetsBinding.scheduleAttachRootWidget.<anonymous closure> (package:flutter/src/widgets/binding.dart:1347:7)
binding.dart:1347
#963    _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:193:12)
isolate_patch.dart:193
(elided 3 frames from class _Timer and dart:async-patch)


════════════════════════════════════════════════════════════════════════════════

════════ Exception caught by rendering library ═════════════════════════════════
A RenderFlex overflowed by 98954 pixels on the bottom.
The relevant error-causing widget was:
    Column Column:file:///media/silas/Data/Dev/Flutter_tests/fortune_cookie/lib/main.dart:50:16
════════════════════════════════════════════════════════════════════════════════
```

he uses Provider.of() to retrieve a var in the beginning (for debugging?)

NOTE: # 7.5 - Provider.of<type>() must always be used in a build context - as valuse do not update automatically on the UI.
Provider.of<type>() therefore is also GLOBAL!
i.e. DO NOT use when wrapped in a function (because of context scope):

```
int getValue(BuildContext context){
  return Provider.of<YourModel>(context).yourvalue;
}
```

14/11/25
--------

# 7.7 refactor utip

implement a Provider

 - ALMOST... MUST remember to add notifyListeners() on the migrated methods.
 - for the utip main.dart, he uses a Provider.of()
 - also, he uses the same model in more than one widget (I did, in tip_percent_slider.dart)



17/11/25
--------
# 7.7 finalisation

 - commit changes to branch, push

# 7.8 theme provider, UTIP

 - light/dark theme toggle button:
 
for MULTIPROVIDER (from the VS Code tooltip for MultiProvider):

*********************************************************************************************
(new) MultiProvider MultiProvider({
  Key? key,
  required List<SingleChildWidget> providers,
  Widget? child,
  Widget Function(BuildContext, Widget?)? builder,
})
Declared in MultiProvider in package:provider/src/provider.dart.

Build a tree of providers from a list of [SingleChildWidget].

The parameter builder is syntactic sugar for obtaining a [BuildContext] that can read the providers created.

This code:

MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something()),
    Provider<SomethingElse>(create: (_) => SomethingElse()),
    Provider<AnotherThing>(create: (_) => AnotherThing()),
  ],
  builder: (context, child) {
    final something = context.watch<Something>();
    return Text('$something');
  },
)
is strictly equivalent to:

MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something()),
    Provider<SomethingElse>(create: (_) => SomethingElse()),
    Provider<AnotherThing>(create: (_) => AnotherThing()),
  ],
  child: Builder(
    builder: (context) {
      final something = context.watch<Something>();
      return Text('$something');
    },
  ),
)
If the some provider in providers has a child, this will be ign   ored.

This code:

MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something(), child: SomeWidget()),
  ],
  child: Text('Something'),
)
is equivalent to:

MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something()),
  ],
  child: Text('Something'),
)
For an explanation on the child parameter that builder receives, see the "Performance optimizations" section of [AnimatedBuilder]. 
*********************************************************************************************

Switch.onChanged contextual example:

onChanged: (bool newValue) {
    setState(() {
      _giveVerse = newValue;
    });
  },




19/11/25
--------


08/12/25
--------

may need to do this:

if:
flutter run error "CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage"



https://stackoverflow.com/questions/67396100/flutter-linux-build-error-when-executing-flutter-run-d-linux/69430293#69430293

(it's for Mint, but worked for Ubuntu 22.04 as well)

need to do a flutter clean as well to remove cached artefacts that point to the wrong compiler

21/12/25
--------

If a state provider is used, does that mean the widget havubg its state managed can be a STATELESS widget? - because the main() function - and hence the build method - are not called?

22/12/25
--------
For the dark mode toggle:
 - he uses an icon, with a ternary operator to return the correct one. My toggle version returns a boolean, so can I make a provider method to do this as well?

## section 7.10 OOP/Inheritance in Dart

He uses the Person class example:

 - This uses the Dartpad online resource (as did 6:10 OOP intro)

from this:

```dart
void main() {
  Person x=Person("bob",12);
  x.greeting();
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  // methods
  void greeting(){
    print("hello, I am $name");
  }
}
```


The subclass needs to call the constructor of the superclass... This is the key syntactical thing here:


```dart
void main() {
  Mammal stoat = Mammal("Stoaty mcstoatface","stoat",476);
  
  // or, superclass
  Animal shark = Animal("bitey mc bite bite");
  
  stoat.eat();
  stoat.sleep();
  stoat.info();
  
  shark.eat();
}

class Animal {
  String name;

  Animal(this.name);

  void eat() {
    print("$name is eating");
  }
  
  void sleep() {
    print("$name is sleeping");
  }
}

class Mammal extends Animal {
  String species;
  
  // and he uses 
  int age;
  
  // Mammal() : super(name);
  // Mammal(String name) : super(name);
  // like this:
  // ClassName(var superclassvarname, this.localvar): super(superclassvarname)
  Mammal(String name, this.species, this.age) : super(name);
  
  void info(){
    print("age: $age\nspecies: $species");
  }
}
```

## section 7.11 OOP/Inheritance in Flutter widgets

 - intro
 - CTRL + click on a widget will open that widget source (in VSCode) - same as F12, rt-click/go to definition :

## section 7.12 override and toString()

in Dartpad again

what he is actually doing here is to call super INSIDE the subclass - so it looks like we don't have direct access from an instance??

### toString()

Does indeed stringify the object...
can also use super.toString() if subclass instance has overridden a toString() method


## 8.1 movie app demo

## 8.2 create project

 - flutter create ...
 - set up provider up-front!!
 
 install provider up-front:
 from VSCode - 'add' ->
  for add/assist pubspec:
  (does not exist in VSCode any more. Doing it manually...)
   - add to dependencies: node in yaml file:
   
   `provider: ^6.1.1`
   
   hmm... `stf` no longer brings up the flutter options
   ARGH!! Its actually INLINE autocomplete!! So not broken after all :-)
   
 Builds a simple list o movie titles. The key takehome in this section is the CONTEXT includes the scope for the text array from which the data is pushed to the Text() within the loop
 
## 8.3 lists and loops

A Collection to organize classes?
 - see dartpad code
 
## 8.4 lists and loops 2

 - list manipulation
 - generics

 Hmm. he notes that if the array is untyped:
 
 var x = ['x','y'];
 
 that this will imply that ALL indicies should be strings. But that is not so...
 
## 8.5
 
 List manipulation
 
 
 
## 8.6 providers

 - _private vs public vars
 - getters
 - functions
 - in the runApp - is where we need to wrap with a change notified widget - which gives us access to the provider data and methods: 
 
 Oddness with BuildContext, or not. See notes in code.
 
