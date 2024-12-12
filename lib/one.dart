import 'package:flutter/material.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  List<int> tiles = List.generate(16, (index) => index);

  @override
  void initState() {
    super.initState();
    tiles.shuffle();
  }

  void shuffleTiles() {
    setState(() {
      tiles.shuffle();
    });
  }

  void swapTiles(int index) {
    int emptyIndex = tiles.indexOf(15); //Assume 15 is the empty tile
    if ((index - 1 == emptyIndex && index % 4 != 0) || // Left
        (index + 1 == emptyIndex && emptyIndex % 4 != 0) || // Right
        (index - 4 == emptyIndex) || // Up
        (index + 4 == emptyIndex)) // Down
    {
      setState(() {
        tiles[emptyIndex] = tiles[index];
        tiles[index] = 15;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sliding Puzzle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => swapTiles(index),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      color: tiles[index] == 15 ? Colors.grey : Colors.blue,
                      child: Center(
                        child: Text(
                          tiles[index] == 15 ? "" : '${tiles[index] + 1}',
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: shuffleTiles,
            child: const Text(
              'Restart Game',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
