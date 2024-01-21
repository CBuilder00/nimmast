# Nimmsta Lib Package

## Overview
`nimmsta_lib` is a Dart package designed for seamless interaction with RESTful APIs provided by `{JSON} Placeholder`. It simplifies common API tasks such as fetching, creating, updating, and deleting data, offering a user-friendly interface for API interactions.

For a detailed documentation please check [here](https://github.com/CBuilder00/nimmast/blob/master/Nimmsta%20docs.pdf).

## Getting Started
To integrate `nimmsta_lib` into your Dart project, include it in your `pubspec.yaml`:

```
dependencies:
  nimmsta_lib: ^1.0.0
```

After adding the dependency, run:

```
pub get
```

## Usage
Start by importing `nimmsta_lib` in your Dart files where API interactions are required:

```
import 'package:nimmsta_lib/nimmsta_lib.dart';
```

With the package imported, you can utilize its functionality. For instance, to create a new user:
```
UserClient userClient = UserClient();
User newUser = await userClient.createUser(
  User(
    name: 'Jane Doe',
    email: 'jane.doe@example.com',
    // ... additional user fields
  )
);
```

## Contact
For questions and feedback, please contact `support@nimmsta.com`.
