# Flutter To-Do App with Generative AI

This project is a Flutter-based to-do application enhanced with generative AI to help divide tasks into smaller, manageable steps. The app leverages a serverless Node.js proxy to securely handle API requests.

## Features

- **Task Management:** Create, edit, and delete tasks.
- **Generative AI Assistance:** Get concise help notes for tasks, broken down into smaller steps.
- **Secure API Requests:** Use a serverless Node.js proxy to hide the API key and handle requests to the Google Gemini API.

## Screenshots

[Include some screenshots of your app here]

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- [Node.js](https://nodejs.org/) installed on your machine.
- A [GitHub](https://github.com/) account.

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. **Install Flutter Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Set Up the Node.js Proxy Server:**

   Navigate to the `server` directory and install the required dependencies:

   ```bash
   cd server
   npm install
   ```

4. **Deploy the Node.js Proxy Server:**

   Follow these steps to deploy the serverless Node.js proxy using Vercel:

   - Install Vercel CLI:
     ```bash
     npm install -g vercel
     ```
   - Deploy to Vercel:
     ```bash
     vercel
     ```
   - Follow the prompts to deploy the server. Note down the deployment URL provided by Vercel.

5. **Update the API URL in Flutter App:**

   In `lib/gemini_service.dart`, replace the placeholder URL with your Vercel deployment URL:
   
   ```dart
   final String proxyUrl = 'https://your-vercel-deployment-url.vercel.app/generateContent';
   ```

6. **Build and Run the Flutter App:**

   ```bash
   flutter run
   ```

### Deploying the Flutter Web App to GitHub Pages

1. **Build the Flutter Web App:**

   ```bash
   flutter build web
   ```

2. **Deploy to GitHub Pages:**

   ```bash
   cd your-repo
   git init
   git remote add origin https://github.com/your-username/your-repo.git
   git checkout -b gh-pages
   git rm -rf .
   cp -r build/web/* .
   git add .
   git commit -m "Deploy Flutter web app to GitHub Pages"
   git push -u origin gh-pages
   ```

3. **Configure GitHub Pages:**

   - Go to your repository on GitHub.
   - Click on `Settings`.
   - Scroll down to the `GitHub Pages` section.
   - Under `Source`, select the `gh-pages` branch.
   - Save your settings.

Your Flutter web app should be available at `https://your-username.github.io/your-repo/`.

## Usage

1. Open the app.
2. Enter a task in the input field.
3. Tap the "Get Help Note" button.
4. View the generated help note with steps to achieve the task.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Node.js](https://nodejs.org/)
- [Google Gemini API](https://ai.google.dev/gemini-api/)
- [Vercel](https://vercel.com/)

