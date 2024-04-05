# Wizarding World
A Flutter-based application, using an API around the Wizarding World in the Harry Potter universe and is aimed at working on architecture, DevOps and widget design.

![Static Badge](https://img.shields.io/badge/flutter-architecture-brightgreen?style=for-the-badge&logo=flutter)
![Static Badge](https://img.shields.io/badge/flutter-challenge-red?style=for-the-badge&logo=flutter)

### Tech Stack

| Tech         | Version  |
|--------------|:--------:|
| Flutter      |  3.19.4  |
| Dart         |  3.3.2   |

### CD/CI

The pipeline for the application is split into two (2) pipeline files:

#### PR Pipeline
The PR pipeline runs when a PR is created or updated and does the necessary testing and analysis of the codebase. A successful run of this pipeline is required for a pull-request to be merged

#### Merge Pipeline
A merge pipeline is fired off when a pull-request is merged into the `main` branch.

This pipeline is meant to build an artefact for each of the platforms defined.

### Usage

To test the application locally, simply `clone` the repository, and run the following command, for your platform, to build the necessary artefacts to run.

```dart
flutter build {your_platform}
```

The artefacts will be stored under `/src/build/{platform}/`.

Alternately, you can juse open the project in `VS Code` or `Android Studio` and run the application in debug mode.

### Screen shots

Screen shots of the current progress has been uploaded into the `screenshots` directory, ordered per sprint.

### TODO

There is a TODO which shows the progress on the project as it's being developed. Check it out [here](TODO)

### Unit tests and coverage

Unit testing and coverage is handled by the `PR pipeline` and submitted as part of the PR view, example of this below. 

Code coverage can also be checked by running `flutter test --coverage` with an `*.lcov` file generated under `/src/coverage` which can be viewed in any manner.

I use [LCOV Viewer](https://lcov-viewer.netlify.app/) to view `*.lcov` files in a more visual representable manner.

At the time of writing, `shields.io` was blocked from displaying a badge for coverage, and the badge has been removed. There is a TODO to rectify in due course.

![image](https://github.com/JadedEric/wizarding-world/assets/1898304/3924979d-b14b-4027-991f-ead527312e95)

### Architecture

Coming from a .Net background, I'm always finding myself trying out the `Clean Architecture` pattern for my project, where possible.

`Clean` has come under fire a lot as of late, due to it's large amount of structure duplication, especially if you use `vertical slice` structures in your project, and this is also true within the Flutter space, as you can clearly see in the layout of the project here.

What I like about `Clean`, specially in Flutter, is the clear separation of concerns regarding the views you output. You you everything defined by the feature, and everything that drives the feature is contained.
