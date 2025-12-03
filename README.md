# my_books

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Task Overview — MyBooks Flutter Application
You are required to develop a Flutter application named MyBooks with the following features
and expectations.
Folder Structure 
use MVC-Model,View, Controller
Core Features
1. Authentication
• Include a Login Screen.
• After logging in, the user should remain persistently logged in (local storage using
SharedPreferences/Hive/etc.).
• User should be redirected to the Home screen only when logged in.
Book Features
2. List of Books
• Fetch novels from a REST API:
https://openlibrary.org/subjects/novel.json
• Display them in a paginated list.
3. Book Details
• When a book is selected, show a details page with additional information.
4. Favorites
• Allow the user to:
o Mark/unmark books as Favourites.
o Store favourites locally (using local database or SharedPreferences).
• Provide a separate Favourites Screen where:
o All favourited books appear.
o User can remove from favourites.
Technical Expectations
State Management
• Provider (preferred).
Architecture & Code Quality
• Clean folder structure.
• Meaningful naming for variables, files, and classes.
• Follow null safety principles.
• Include proper documentation and comments in code.
Responsiveness
• UI must be responsive across all device sizes.
Error Handling
• Proper API error handling.
• Show fallback UI for:
o No internet
o API failure
o Empty favorites
Deliverables
1. GitHub Repository Link containing:
o Do NOT push the entire project at once.
o The repository must show progressive development through:
• Small, meaningful commits
• Clear, descriptive commit messages
• Logical separation of features (e.g., “Add login UI”, “Implement Provider
for books”, “Add favourites persistence”)
o This helps reviewers understand how the app evolved and ensures better code
readability and maintainability.

