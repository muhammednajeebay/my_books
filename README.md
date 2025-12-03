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

## Step-by-Step Todo List

### Phase 1: Project Setup & Architecture
- [x] **Step 1.1**: Initialize Flutter project and configure dependencies (Provider, SharedPreferences/Hive, HTTP client)
- [x] **Step 1.2**: Set up MVC folder structure (models/, views/, controllers/)
- [x] **Step 1.3**: Configure Provider for state management setup
- [x] **Step 1.4**: Set up routing and navigation structure

### Phase 2: Authentication Feature
- [x] **Step 2.1**: Create Login Screen UI (View)
- [x] **Step 2.2**: Implement Login Controller with authentication logic
- [x] **Step 2.3**: Implement persistent login using SharedPreferences
- [x] **Step 2.4**: Add authentication state management with Provider
- [x] **Step 2.5**: Implement route guards to redirect to Home only when logged in
- [x] **Step 2.6**: Test persistent login (app restart should maintain login state)

### Phase 3: Books List Feature
- [ ] **Step 3.1**: Create Book Model class
- [ ] **Step 3.2**: Create API service to fetch novels from https://openlibrary.org/subjects/novel.json
- [ ] **Step 3.3**: Implement Books Controller with Provider for state management
- [ ] **Step 3.4**: Create Books List View with pagination
- [ ] **Step 3.5**: Add loading states and error handling for API calls
- [ ] **Step 3.6**: Implement fallback UI for no internet and API failure scenarios

### Phase 4: Book Details Feature
- [ ] **Step 4.1**: Create Book Details View
- [ ] **Step 4.2**: Implement navigation from book list to details page
- [ ] **Step 4.3**: Display additional book information on details page
- [ ] **Step 4.4**: Add error handling for book details

### Phase 5: Favorites Feature
- [ ] **Step 5.1**: Create Favorites Controller with Provider
- [ ] **Step 5.2**: Implement local storage for favorites (SharedPreferences/Hive)
- [ ] **Step 5.3**: Add mark/unmark favorite functionality in Book Details and List views
- [ ] **Step 5.4**: Create Favorites Screen View
- [ ] **Step 5.5**: Display all favorited books in Favorites Screen
- [ ] **Step 5.6**: Implement remove from favorites functionality
- [ ] **Step 5.7**: Add empty favorites fallback UI

### Phase 6: UI/UX Polish & Responsiveness
- [ ] **Step 6.1**: Ensure responsive design across all device sizes
- [ ] **Step 6.2**: Add proper loading indicators and animations
- [ ] **Step 6.3**: Improve UI aesthetics and user experience
- [ ] **Step 6.4**: Test on different screen sizes (phone, tablet)

### Phase 7: Code Quality & Documentation
- [ ] **Step 7.1**: Review and ensure meaningful naming for variables, files, and classes
- [ ] **Step 7.2**: Verify null safety principles are followed throughout
- [ ] **Step 7.3**: Add proper documentation and comments in code
- [ ] **Step 7.4**: Code cleanup and refactoring

### Phase 8: Testing & Finalization
- [ ] **Step 8.1**: Test all features end-to-end
- [ ] **Step 8.2**: Verify error handling for all scenarios (no internet, API failure, empty states)
- [ ] **Step 8.3**: Ensure persistent login works correctly
- [ ] **Step 8.4**: Verify favorites persistence works correctly

### Phase 9: Git Commits & Repository
- [ ] **Step 9.1**: Make small, meaningful commits for each completed step
- [ ] **Step 9.2**: Write clear, descriptive commit messages
- [ ] **Step 9.3**: Ensure logical separation of features in commits
- [ ] **Step 9.4**: Push commits progressively (not entire project at once)

---

## Original Requirements

### Folder Structure 
- use MVC-Model,View, Controller

### Core Features
1. Authentication
• Include a Login Screen.
• After logging in, the user should remain persistently logged in (local storage using
SharedPreferences/Hive/etc.).
• User should be redirected to the Home screen only when logged in.

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

### Technical Expectations
**State Management**
• Provider (preferred).

**Architecture & Code Quality**
• Clean folder structure.
• Meaningful naming for variables, files, and classes.
• Follow null safety principles.
• Include proper documentation and comments in code.

**Responsiveness**
• UI must be responsive across all device sizes.

**Error Handling**
• Proper API error handling.
• Show fallback UI for:
o No internet
o API failure
o Empty favorites

### Deliverables
1. GitHub Repository Link containing:
o Do NOT push the entire project at once.
o The repository must show progressive development through:
• Small, meaningful commits
• Clear, descriptive commit messages
• Logical separation of features (e.g., "Add login UI", "Implement Provider
for books", "Add favourites persistence")
o This helps reviewers understand how the app evolved and ensures better code
readability and maintainability.