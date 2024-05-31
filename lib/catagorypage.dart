import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  final List<String> categories = [
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Science Fiction',
    'Romance',
    'Thriller',
    'Animation',
  ];

  final List<Color> categoryColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Categories'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            color: categoryColors[index],
            child: ListTile(
              title: Text(
                categories[index],
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryMoviesPage(category: categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoryMoviesPage extends StatelessWidget {
  final String category;

  CategoryMoviesPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Movies'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: _buildCategoryContent(),
      ),
    );
  }

  Widget _buildCategoryContent() {
    switch (category) {
      case 'Action':
        return _buildActionGrid();
      case 'Comedy':
        return _buildComedyGrid();
      default:
        return _buildDefaultContent();
    }
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie, size: 50, color: Colors.blueGrey),
                  SizedBox(height: 10),
                  Text(
                    'Movie ${index + 1}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildComedyGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.orange[100],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie, size: 50, color: Colors.orange),
                  SizedBox(height: 10),
                  Text(
                    'Comedy ${index + 1}',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefaultContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (category == 'Drama')
          Image.network(
            'https://upload.wikimedia.org/wikipedia/en/0/01/Neru_film_poster.jpg',
            width: 150,
            height: 150,
          ),
        if (category == 'Horror')
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo_J-bABX_T57O6zF960xyphLnKtVv2HPHQ0obpcU31A&s',
            width: 150,
            height: 150,
          ),
        SizedBox(height: 20),
      ],
    );
  }
}
