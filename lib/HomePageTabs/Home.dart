import 'package:aljid/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _ayahs = [];
  int _currentAyah = 0;

  @override
  void initState() {
    super.initState();
    getAyahByRef(1, 1, 7);
  }

  Future<void> getAyahByRef(int surahNumber, int startAyah, int endAyah) async {
    final text = await rootBundle.loadString('lib/Assets/quran.txt');
    final lines = text.split('\n');
    final results = lines.where((line) {
      final parts = line.split('|');
      final surah = int.parse(parts[0]);
      final ayah = int.parse(parts[1]);
      return surah == surahNumber && ayah >= startAyah && ayah <= endAyah;
    }).map((line) => line.split('|')[2]);

    setState(() {
      _ayahs = results.toList();
    });

    // Create a list of ayah numbers
    final ayahNumbers =
        List.generate(_ayahs.length, (index) => startAyah + index);

    // Combine the ayahs with the ayah numbers
    final combined = ayahNumbers
        .map((ayahNumber) => '$ayahNumber')
        .toList()
        .asMap()
        .map((index, ayahNumber) =>
            MapEntry(index * 2, _ayahs[index] + ' {' + ayahNumber + '}'))
        .values
        .toList();

    setState(() {
      _ayahs = combined;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF142E2B),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: BriefOnTopStatics(),
            ),
            Expanded(
              flex: 3,
              child: Text('Mama'),
            ),
            Expanded(
              flex: 1,
              child: Text('Mama'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BriefOnTopStatics() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: itemsInThemeColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleCircularProgressBar(
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()}%',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 30,
                      ),
                    );
                  },
                  progressColors: const [Colors.green],
                  mergeMode: true,
                  animationDuration: 2,
                  valueNotifier: ValueNotifier(30),
                  backStrokeWidth: 15,
                  progressStrokeWidth: 10,
                  size: 80,
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'مرحباً',
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
