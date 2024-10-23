# financial_products

A cross-platform mobile application that fetches & displays [Norrenberger](https://www.norrenberger.com) financial investment products.

## Getting Started

This project is currently written in Dart with Flutter.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### SDK Setup

The project uses Flutter Version Manager (FVM) to access its SDK. Ensure FVM is set up on your machine.

NB: This setup is optional, you can always use the default SDK on your machine to run and build the project.

## Project structure

When it comes to folder structure, the project uses a feature-first approach to create a modular project structure while employing a layered architecture.

`/src` : This folder contains all the source code used in building the app.\
`/src/core`: This folder contains reusable modules that are used within the app, e.g `extensions`, `utils`, `shared widgets` and so on.\
`/features`: This module contains implemented modular app features.\
`/exceptions`: This module contains custom exception classes used within the app.\
`/res`: This contains applicationwide resources like `strings`, `colors`, `image paths` and so on.\
`/routing`: This contains applicationwide routing system.\
`/theme`: This module contains applicationwide theming implementaton details.

NB: All modules not explicitly prefixed with '/src' are in the source directory.

## Responsive Components

This project also demonstrates how building adaptive UIs can be achieved by employing my [Screendapt package](https://github.com/Kodrillar/screendapt) which utilizes the [Flutter Screenutil package](https://pub.dev/packages/flutter_screenutil) under the hood to ensure UI components are adaptive. Box Constraints and MediaQuery sizes are being used as well. This approach is similar to the traditional approach in designing responsive layouts using web technologies like HTML & CSS.

By utilizing the box contraints' `maxWidth` property, components can be constrained to a particular width (maximum width) then this contraint is used to programmatically determine when the screenutil package will be employed in the UI.