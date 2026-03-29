import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return const MaterialApp(
debugShowCheckedModeBanner: false,
home: LoginScreen(),
);
}
}

//////////////// LOGIN //////////////////

class LoginScreen extends StatelessWidget {
const LoginScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [

      Positioned(
        top: -20,
        right: -20,
        child: Image.asset("assets/flower.png", width: 250),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.asset("assets/logo.png", height: 120),

              const SizedBox(height: 30),

              TextField(
                decoration: InputDecoration(
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(
                  hintText: "Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

}
}

//////////////// HOME //////////////////

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
body: Stack(
children: [

      Positioned(
        top: -20,
        right: -20,
        child: Image.asset("assets/flower.png", width: 250),
      ),

      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset("assets/logo.png", height: 120),

            const SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StoreScreen()),
                );
              },
              child: const Text("Go to Store"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrdersScreen()),
                );
              },
              child: const Text("My Orders"),
            ),
          ],
        ),
      ),
    ],
  ),
);

}
}

//////////////// STORE //////////////////

class StoreScreen extends StatelessWidget {
const StoreScreen({super.key});

@override
Widget build(BuildContext context) {
final models = [
{"name": "Model 1", "image": "assets/model1.jpg"},
{"name": "Model 2", "image": "assets/model2.jpg"},
{"name": "Model 3", "image": "assets/model3.jpg"},
];

return Scaffold(
  appBar: AppBar(title: const Text("Store")),
  body: Stack(
    children: [

      Positioned(
        top: -20,
        right: -20,
        child: Image.asset("assets/flower.png", width: 200),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: models.map((model) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 55),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductScreen(
                          model: model["name"]!,
                          image: model["image"]!,
                        ),
                      ),
                    );
                  },
                  child: Text(model["name"]!),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  ),
);

}
}

//////////////// PRODUCT //////////////////

class ProductScreen extends StatefulWidget {
final String model;
final String image;

const ProductScreen({super.key, required this.model, required this.image});

@override
State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
String selectedSize = "48";
String selectedColor = "Black";

final sizes = ["48", "50", "52", "54"];
final colors = ["Black", "White", "Blue"];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(widget.model)),
body: Stack(
children: [

      Positioned(
        top: -20,
        right: -20,
        child: Image.asset("assets/flower.png", width: 200),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image.asset(widget.image, height: 150),

              const SizedBox(height: 20),

              const Text("Size Guide"),
              const SizedBox(height: 10),

              const Text("70kg • 150cm = 48"),
              const Text("80kg • 154cm = 50"),
              const Text("90kg • 158cm = 52"),
              const Text("100kg • 162cm = 54"),

              const SizedBox(height: 20),

              DropdownButton<String>(
                value: selectedSize,
                isExpanded: true,
                items: sizes.map((size) {
                  return DropdownMenuItem(value: size, child: Text(size));
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedSize = value!);
                },
              ),

              const SizedBox(height: 10),

              DropdownButton<String>(
                value: selectedColor,
                isExpanded: true,
                items: colors.map((color) {
                  return DropdownMenuItem(value: color, child: Text(color));
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedColor = value!);
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutScreen(
                        size: selectedSize,
                        color: selectedColor,
                      ),
                    ),
                  );
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

}
}

//////////////// CHECKOUT //////////////////

class CheckoutScreen extends StatelessWidget {
final String size;
final String color;

const CheckoutScreen({super.key, required this.size, required this.color});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Checkout")),
body: Stack(
children: [

      Positioned(
        top: -20,
        right: -20,
        child: Image.asset("assets/flower.png", width: 200),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("Size: $size"),
              Text("Color: $color"),

              const SizedBox(height: 20),

              const Text("Reserve Item", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("Reserve at nearest branch for 24 hours"),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SuccessScreen()),
                  );
                },
                child: const Text("Reserve"),
              ),

              const SizedBox(height: 30),

              const Text("Buy with Delivery", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("Delivery within 24 hours"),
              const Text("Try before payment"),
              const Text("Delivery: 3\$"),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SuccessScreen()),
                  );
                },
                child: const Text("Buy Now"),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

}
}

//////////////// SUCCESS //////////////////

class SuccessScreen extends StatelessWidget {
const SuccessScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
body: const Center(
child: Text("Successfully 🎉", style: TextStyle(fontSize: 18)),
),
);
}
}

//////////////// ORDERS //////////////////

class OrdersScreen extends StatelessWidget {
const OrdersScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("My Orders")),
body: const Center(
child: Text("You have no previous orders"),
),
);
}
}