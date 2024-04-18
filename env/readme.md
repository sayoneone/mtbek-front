# Flutter Environment Management
This Flutter application uses environment variables for managing different configurations. It is essential to provide the correct environment variables to ensure that the application runs properly.

## Environment Files
We have two environment configurations for this application:

- Production environment: `./env/prod.json`
- Development environment: `./env/dev.json`
- Make sure to use the appropriate environment file when building or running the application.

## Providing Environment Variables
To supply the environment variables to the application, use the --dart-define-from-file option when running build or run commands. This option allows you to specify a file containing the environment variables, which will then be used during the build or run process.

Here's an example of how to provide environment variables using the --dart-define-from-file option:

```bash
# Building the app for production
flutter build apk --dart-define-from-file=./env/prod.json

# Building the app for development
flutter build apk --dart-define-from-file=./env/dev.json

# Running the app in production mode
flutter run --dart-define-from-file=./env/prod.json

# Running the app in development mode
flutter run --dart-define-from-file=./env/dev.json
```

Replace `./env/prod.json` or `./env/dev.json` with the path to your desired environment variables file.