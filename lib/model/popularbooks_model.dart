class PopularBooks {
  final String image;
  final String title;
  final String author;

  PopularBooks({
    required this.image,
    required this.title,
    required this.author,
  });
}

List<PopularBooks> popular = [
  PopularBooks(
    image:
        'https://images.unsplash.com/photo-1526559881144-9df4bf3eb37a?auto=format&fit=crop&q=80&w=1771&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'History of the Ancient Worlds',
    author: 'Dr. Tikendranath Sarkar',
  ),
  PopularBooks(
    image:
        'https://plus.unsplash.com/premium_photo-1661962345279-4d1d7a98409a?auto=format&fit=crop&q=80&w=1770&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'A history of Babylon',
    author: 'Description for Item 3',
  ),
  PopularBooks(
    image:
        'https://images.unsplash.com/photo-1582034438152-77bc94ffa6ae?auto=format&fit=crop&q=80&w=1746&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'The Egyptian Pyramid',
    author: 'Paul Beaulieu',
  ),
  PopularBooks(
    image:
        'https://images.unsplash.com/photo-1494972688394-4cc796f9e4c5?auto=format&fit=crop&q=80&w=1770&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'World War 1',
    author: 'Susan Bauer',
  ),
  PopularBooks(
    image:
        'https://images.unsplash.com/photo-1505664194779-8beaceb93744?auto=format&fit=crop&q=80&w=1770&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Magic in the Ancient Greek World',
    author: 'Derek Collins',
  ),
];
