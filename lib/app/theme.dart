import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light, // Atur brightness sesuai kebutuhan Anda
    primary: Color(0xFF009B0B), // Warna primer yang Anda pilih
    onPrimary: Colors.white, // Warna teks di atas warna primer
    secondary: Color(0xFF00DB0F), // Warna sekunder yang Anda pilih
    onSecondary: Colors.white, // Warna teks di atas warna sekunder
    error: Colors.red, // Warna untuk error
    onError: Colors.white, // Warna teks di atas error
    surface: Colors.white, // Warna permukaan (misalnya background card)
    onSurface: Colors.black, // Warna teks di atas permukaan
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF009B0B),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(52),
      backgroundColor: const Color(0xFF009B0B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      textStyle: GoogleFonts.poppins(fontSize: 12, color: Colors.white), // Gaya teks di dalam tombol
    ),
  ),
  fontFamily: 'Poppins', 
  textTheme: TextTheme(
    headlineLarge:  GoogleFonts.poppins(fontSize: 20, color: const Color(0xFF009B0B), fontWeight: FontWeight.bold),
    
    titleLarge: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),

    labelMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    labelSmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),

    bodyMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),

  ),
);