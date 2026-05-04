import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({super.key});

  static const List<Map<String, String>> _books = [
    {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
    {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
    {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
    {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
  ];

  @override
  Widget build(BuildContext context) {
    const lavender = Color(0xFFFEF7FF);
    const pageBackground = Colors.white;

    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: lavender,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.go('/profile'),
            icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              'Sorted by Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _books.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final book = _books[index];
                return InkWell(
                  onTap: () => context.go('/byTitle/detail'),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    decoration: BoxDecoration(
                      color: lavender,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          book['author']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: lavender,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 0) context.go('/byAuthor');
          if (index == 2) context.go('/profile');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'By Author',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            activeIcon: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFE8DEF8),
              child: Icon(Icons.text_fields, color: Colors.black, size: 22),
            ),
            label: 'By Title',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}