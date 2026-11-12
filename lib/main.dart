
import 'package:flutter/material.dart';

void main() {
  runApp(const ShopOnlineApp());
}

// COLORS
const Color purple = Color(0xFF6C3CE9);
const Color pink = Color(0xFFFF8FA3);
const Color turquoise = Color(0xFF36CFC9);
const Color orange = Color(0xFFFFB45B);
const Color background = Color(0xFFF8F5FF);
const Color darkText = Color(0xFF292344);

// MAIN APP
class ShopOnlineApp extends StatelessWidget {
  const ShopOnlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHOP ONLINE',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          primary: purple,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: purple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

// MAIN NAVIGATION
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  void goToPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        onAboutTap: () => goToPage(1),
      ),
      AboutPage(
        onContactTap: () => goToPage(2),
      ),
      const ContactPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHOP ONLINE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: pink.withValues(alpha: 0.3),
        onDestinationSelected: goToPage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_mail_outlined),
            selectedIcon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  final VoidCallback onAboutTap;

  const HomePage({
    super.key,
    required this.onAboutTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to SHOP ONLINE!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Discover your favorite products in one place.',
            style: TextStyle(
              fontSize: 16,
              color: darkText,
            ),
          ),

          const SizedBox(height: 20),

          // STORE IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=900',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: pink.withValues(alpha: 0.3),
                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 80,
                      color: purple,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Shop by Categories',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              categoryItem(
                Icons.checkroom,
                'Fashion',
                pink,
              ),
              categoryItem(
                Icons.devices,
                'Electronics',
                turquoise,
              ),
              categoryItem(
                Icons.shopping_bag,
                'Bags',
                orange,
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            'Everything you need, all in one place!',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: purple,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAboutTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              child: const Text('Learn More About Us'),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryItem(
    IconData icon,
    String title,
    Color color,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withValues(alpha: 0.25),
          child: Icon(
            icon,
            color: purple,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
        ),
      ],
    );
  }
}

// ABOUT PAGE
class AboutPage extends StatelessWidget {
  final VoidCallback onContactTap;

  const AboutPage({
    super.key,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(
            radius: 55,
            backgroundColor: pink,
            child: Icon(
              Icons.shopping_cart,
              size: 55,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'About SHOP ONLINE',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'SHOP ONLINE is a modern online shopping store '
            'that makes shopping easier and more enjoyable.\n\n'
            'Our goal is to provide customers with a simple '
            'shopping experience and a variety of products '
            'in one place.\n\n'
            'We care about quality, convenience, and customer satisfaction.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              height: 1.7,
              color: darkText,
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.email),
              label: const Text('Contact Us'),
              style: ElevatedButton.styleFrom(
                backgroundColor: turquoise,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CONTACT PAGE
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();

  void saveData() {
    if (formKey.currentState!.validate()) {
      debugPrint('Name: ${nameController.text}');
      debugPrint('Email: ${emailController.text}');
      debugPrint('Country: ${countryController.text}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Your information has been saved successfully!',
          ),
          backgroundColor: purple,
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.contact_mail,
                size: 65,
                color: purple,
              ),
            ),

            const SizedBox(height: 15),

            const Center(
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: purple,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Please fill in your information below.',
                style: TextStyle(
                  fontSize: 15,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Full Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                prefixIcon: const Icon(
                  Icons.person,
                  color: purple,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Email Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: const Icon(
                  Icons.email,
                  color: purple,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    !RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                        .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Country',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: countryController,
              decoration: InputDecoration(
                hintText: 'Enter your country',
                prefixIcon: const Icon(
                  Icons.public,
                  color: purple,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: saveData,
                icon: const Icon(Icons.save),
                label: const Text(
                  'SAVE INFORMATION',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
