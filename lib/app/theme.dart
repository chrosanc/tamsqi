import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light, // Atur brightness sesuai kebutuhan Anda
    primary: Color(0xFF009B0B), // Warna primer yang Anda pilih
    onPrimary: Colors.white, // Warna teks di atas warna primer
    secondary: Color(0xFF00DB0F), // Warna sekunder yang Anda pilih
    onSecondary: Colors.white, // Warna teks di atas warna sekunder
    error: Colors.red, // Warna untuk error
    onError: Colors.white, // Warna teks di atas error
    surface: Colors.grey, // Warna permukaan (misalnya background card)
    onSurface: Colors.black, // Warna teks di atas permukaan
  ),
  primaryColor: Color(0xFF009B0B), // Warna primer untuk aplikasi
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: GoogleFonts.poppins(fontSize: 12), // Gaya teks di dalam tombol
    ),
  ),
  fontFamily: 'Poppins', 
  textTheme: TextTheme(
    titleLarge:  GoogleFonts.poppins(fontSize: 20),
    titleMedium: GoogleFonts.poppins(fontSize: 16)
  ),
);