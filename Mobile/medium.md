## medium level challenge 
### motivation 
if you are a user of the famous framework flutter, you have probably heard the phrase "everything is a widget", I think we all agree with that, but I think we can also say "everything is a package" too.
since the creation of this framework in 2017, its community was always very active and that either by contributing directly to the heart of the framework or by publishing packages & plugins in [pub.dev](https://pub.dev/).

### introduction 

if you are a user of google photos, github, facebook and a lot of other applications / services, i assume that you have already experienced this kind of views .

|google photos|github 1|github 2|gdg events app|
|:------------:|:------------:|:-------------:|:-------------:|
![google photos](./assets/google_photos.png)|![github 1](./assets/github_members.png)|![github 2](././assets/github_contributers.png)|![gdg events app](./assets/events_app2.png)|

### main objective
the main goal of this challenge is to realize&publish a package that aims to facilitate the implementation of this kind of widgets , this is an example of how this package should be used (you don't have to follow it).

```dart
import 'package:package_name/package_name.dart';

PackageName(
    listeOfElements : list ,
    spaceBetweenElements : space ,
    elementShape , PackageName.circle,
    borders : border
);
```


### rules 
no third party package is allowed to use .
the package must bu published on pub.dev .

