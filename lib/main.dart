import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewScreen(),    );
  }
}

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];

  void _addItem() {
    setState(() {
      _items.add('Item${_items.length + 1}');
      _listKey.currentState?.insertItem(_items.length - 1);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View', textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return _buildListItem(_items[index], animation);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.blue, // Blue background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Circular shape
          side: const BorderSide(color: Colors.white, width: 1), // White border
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white, // White plus sign
        ),
      ),
    );
  }

  Widget _buildListItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.person, color: Colors.white, size: 40),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      'assets/images/frog.jpg',
                      fit: BoxFit.cover, // Ensures the image covers the available space
                      height: 60,
                      width: 100,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
