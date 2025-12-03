import 'package:flutter/material.dart';
import 'package:my_books/models/book_model.dart';
class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final Work book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title ?? "Book Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // --- Title ---
            Text(
              book.title ?? "Unknown Title",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),

            // --- Authors ---
            if (book.authors != null && book.authors!.isNotEmpty)
              Text(
                "By ${book.authors!.map((a) => a.name).join(', ')}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                    ),
              ),

            const SizedBox(height: 12),

            // --- Publish Year ---
            if (book.firstPublishYear != null)
              Text(
                "First Published: ${book.firstPublishYear}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

            const SizedBox(height: 20),

            // --- Subjects ---
            if (book.subject != null && book.subject!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subjects:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: book.subject!
                        .take(6) // limit to avoid clutter
                        .map((s) => Chip(label: Text(s)))
                        .toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}