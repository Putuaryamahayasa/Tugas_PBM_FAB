// File: note_list_page.dart

import 'package:flutter/material.dart';
import 'add_note_page.dart'; // Impor halaman untuk menambah catatan

// Model data untuk sebuah catatan
class Note {
  String title;
  String content;

  Note({required this.title, required this.content});
}

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  // List untuk menyimpan semua catatan. Ini adalah "state" kita.
  final List<Note> _notes = [];

  // Fungsi untuk navigasi ke halaman tambah catatan dan menerima data kembali
  void _addNote() async {
    // Tunggu hasil dari halaman AddNotePage
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNotePage()),
    );

    // Jika pengguna menyimpan catatan (newNote tidak null), tambahkan ke list
    if (newNote != null) {
      setState(() {
        _notes.add(newNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Saya')),
      body:
          _notes.isEmpty
              // Tampilkan pesan jika tidak ada catatan
              ? const Center(
                child: Text(
                  'Belum ada catatan.\nTekan tombol + untuk menambah.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              // Tampilkan daftar catatan jika ada
              : ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(
                        note.content,
                        maxLines: 2, // Batasi konten hanya 2 baris
                        overflow:
                            TextOverflow
                                .ellipsis, // Tampilkan '...' jika teks terlalu panjang
                      ),
                      onTap: () {
                        // TODO: Implementasi untuk melihat atau mengedit detail catatan
                      },
                    ),
                  );
                },
              ),

      // INI BAGIAN UTAMA TUGAS ANDA: FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote, // Panggil fungsi _addNote saat ditekan
        tooltip: 'Tambah Catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
