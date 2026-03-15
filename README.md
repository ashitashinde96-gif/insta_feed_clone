# insta_feed_clone

A Flutter application that replicates the core UI and interactive features of Instagram’s feed. The app demonstrates stories, posts with verified badges, double-tap heart animations, and a comment popup page.

---

## Features

- Horizontal **Stories Section** with randomized profile images  
- Vertical **Post Feed** with captions, likes, and verified badges  
- **Double-tap heart animation** for liking posts  
- **Comment popup page** similar to Instagram  
- Dynamic likes display and Instagram-style layout  

---

## State Management

The app uses **local state management** via Flutter widgets:

- `StatefulWidget` in `PostCard` handles:  
  - Like/unlike toggle  
  - Heart burst animation  
  - Comment popup navigation  

- `StatelessWidget` in `HomeScreen` handles:  
  - Static lists of posts and stories  

> Local state is sufficient for this prototype. For larger apps, global state management solutions like **Provider, Riverpod, or Bloc** can be used.

---

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0  
- Dart >= 3.0  
- Android Studio, VSCode, or Xcode  

### Installation

1. Clone the repository:

```bash
git clone <your-github-repo-link>
cd insta_feed_clone