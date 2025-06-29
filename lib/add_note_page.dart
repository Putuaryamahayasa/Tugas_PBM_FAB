// File: add_note_page.dart

import 'package:flutter/material.dart';
import 'note_list_page.dart'; // Impor class Note

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  // Controller untuk mengambil teks dari TextField
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  // Fungsi untuk menyimpan catatan
  void _saveNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    // Validasi sederhana: judul tidak boleh kosong
    if (title.isNotEmpty) {
      final newNote = Note(title: title, content: content);
      // Kirim data 'newNote' kembali ke halaman sebelumnya (NoteListPage)
      Navigator.pop(context, newNote);
    } else {
      // Tampilkan peringatan jika judul kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul tidak boleh kosong!')),
      );
    }
  }

  // Jangan lupa dispose controller untuk menghindari memory leak
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Baru'),
        actions: [
          // Tombol untuk menyimpan
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveNote,
            tooltip: 'Simpan',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Isi Catatan',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines:
                    null, // Memungkinkan input teks multi-baris tanpa batas
                expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
