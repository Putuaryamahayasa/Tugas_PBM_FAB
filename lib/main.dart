// File: main.dart

import 'package:flutter/foundation.dart'; // Impor untuk kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Impor paket device_preview
import 'note_list_page.dart';

// Ubah main() menjadi seperti ini
void main() => runApp(
  // Gunakan DevicePreview.appBuilder untuk membungkus aplikasi Anda
  DevicePreview(
    enabled:
        !kReleaseMode, // Hanya aktifkan saat mode debug, nonaktif saat rilis
    builder: (context) => const NotesApp(), // Bungkus NotesApp di sini
  ),
);

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Konfigurasi penting untuk device_preview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // Kode Anda yang sudah ada
      title: 'Aplikasi Catatan',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NoteListPage(),
    );
  }
}
