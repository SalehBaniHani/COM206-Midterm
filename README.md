# Gülşah – Smart Clothing App 👗
## COM206 - VISUAL PROGRAMMING | Mid-Term Project

---

## 👨‍🎓 Student Information
| Field | Details |
|-------|---------|
| Name | Saleh Reziq Saleh Bani Hani |
| Course | COM206 - Visual Programming |
| Instructor | DENIZ DAHMAN |
| Repository | [GitHub](https://github.com/SalehBaniHani/COM206-Midterm) |

---

## 🔴 Research Problem
People who shop for clothing online face these real problems:
- They **don't know their correct size** — every brand is different
- They can't **try before they buy**
- Checkout processes are **too long and complicated**
- Apps feel overwhelming with too many buttons and options

---

## 💡 Motivation
I wanted to build something **simple and real** — an app a person could actually use to browse clothes, pick their size confidently, and either reserve or buy with delivery. The focus was not on complexity, but on **clean flow and clear screens**.

---

## 🔁 Control Flow
```
main.dart → MyApp
      ↓
 LoginScreen        ← user enters name + phone
      ↓
 HomeScreen         ← two options: Store or My Orders
      ↓
 StoreScreen        ← shows Model 1, Model 2, Model 3
      ↓
 ProductScreen      ← shows image + size guide + dropdown for size & color
      ↓
 CheckoutScreen     ← Reserve (hold 24h) OR Buy Now (delivery 3$)
      ↓
 SuccessScreen      ← "Successfully 🎉"

 HomeScreen → OrdersScreen  ← shows previous orders
```

Every screen has a **back arrow** from the AppBar —
built automatically by `Navigator.push()` in Flutter.

---

## 🛠️ Implementation Strategy

### All code is in one file: `main.dart`
I used **7 classes**, each one is a separate screen:

| Class | Type | What it does |
|-------|------|--------------|
| `MyApp` | StatelessWidget | App entry point, sets home to LoginScreen |
| `LoginScreen` | StatelessWidget | Name + phone input, navigate to Home |
| `HomeScreen` | StatelessWidget | Two buttons: Store and My Orders |
| `StoreScreen` | StatelessWidget | Lists 3 models using a map loop |
| `ProductScreen` | **StatefulWidget** | Dropdowns for size & color, holds selected values in state |
| `CheckoutScreen` | StatelessWidget | Shows size/color chosen, Reserve or Buy buttons |
| `SuccessScreen` | StatelessWidget | Confirmation screen |
| `OrdersScreen` | StatelessWidget | Placeholder for orders |

### Why ProductScreen is StatefulWidget?
Because the user **changes** the size and color using dropdowns.
I used `setState()` to rebuild the UI when the value changes:
```dart
onChanged: (value) {
  setState(() => selectedSize = value!);
}
```
All other screens don't change — so they are `StatelessWidget`.

### Navigation
I used `Navigator.push()` with `MaterialPageRoute` to move between screens:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const HomeScreen()),
);
```
Data is passed between screens using **constructor parameters**:
```dart
ProductScreen(model: model["name"]!, image: model["image"]!)
CheckoutScreen(size: selectedSize, color: selectedColor)
```

### Size Guide Logic
Built directly into the ProductScreen as text:
```
70kg • 150cm = 48
80kg • 154cm = 50
90kg • 158cm = 52
100kg • 162cm = 54
```
The user then picks their size from a `DropdownButton`.

---

## 📂 Project Structure
```
lib/
 └── main.dart   → all 8 classes (Login, Home, Store, Product, Checkout, Success, Orders)
assets/
 ├── logo.png
 ├── flower.png
 ├── model1.jpg
 ├── model2.jpg
 └── model3.jpg
```

---

## 🚀 How to Run
```bash
git clone https://github.com/SalehBaniHani/COM206-Midterm
cd COM206-Midterm
flutter pub get
flutter run
```

---

## ✅ Mid-Term Checklist
- [x] Follows course scope (environment setup, Flutter SDK, navigation)
- [x] GitHub repo is public with README
- [x] App runs without errors
- [x] Live demo ready
- [x] Problem, motivation, control flow, strategy all documented
