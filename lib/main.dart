import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App - Web',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login successful! Welcome $username')),
    );

    // Clear fields
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;
    final isLargeScreen = screenSize.width >= 900;

    // Calculate responsive values
    final maxWidth = isSmallScreen ? double.infinity : 500.0;
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final iconSize = isSmallScreen ? 60.0 : isLargeScreen ? 100.0 : 80.0;
    final titleFontSize = isSmallScreen ? 24.0 : isLargeScreen ? 32.0 : 28.0;
    final subtitleFontSize = isSmallScreen ? 12.0 : 14.0;
    final buttonHeight = isSmallScreen ? 44.0 : 52.0;
    final spacing1 = isSmallScreen ? 48.0 : 60.0;
    final spacing2 = isSmallScreen ? 12.0 : 16.0;
    final spacing3 = isSmallScreen ? 14.0 : 24.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Portal'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: spacing1),

                // Logo/Icon
                Icon(
                  Icons.account_circle,
                  size: iconSize,
                  color: Colors.blue,
                ),
                SizedBox(height: spacing3),

                // Welcome Title
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spacing2),

                // Subtitle
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spacing1),

                // Username Field
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                ),
                SizedBox(height: spacing3),

                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                ),
                SizedBox(height: spacing3),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: spacing2),

                // Forgot Password Link
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Password reset feature coming soon')),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
                SizedBox(height: spacing3),

                // Sign Up Link
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Sign up feature coming soon')),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                SizedBox(height: spacing1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
