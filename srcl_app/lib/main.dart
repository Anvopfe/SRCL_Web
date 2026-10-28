import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/appointments_screen.dart';

void main() {
  runApp(const SRCLApp());
}

class SRCLApp extends StatelessWidget {
  const SRCLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRCL - Citas en Línea',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A3C6E),
          primary: const Color(0xFF1A3C6E),
          secondary: const Color(0xFF0D254C),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A3C6E),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/booking': (context) => const BookingScreen(),
        '/appointments': (context) => const AppointmentsScreen(),
      },
    );
  }
}
