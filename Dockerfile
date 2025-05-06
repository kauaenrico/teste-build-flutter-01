# Use the official Flutter image as the base image
FROM cirrusci/flutter:latest

# Set the working directory
WORKDIR /app

# Copy the pubspec files and download dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the application code
COPY . .

# Build the Flutter app
RUN flutter build apk --release

# Set the default command to run the app
CMD ["flutter", "run"]