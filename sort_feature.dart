void main() {
  List<String> fileNames = [
    'file1.part.2.section4.group7.txt',
    'file1.part.1.section3.group6.txt',
    'file1.part.10.section4.group5.txt',
    'file2.part.1.section2.group9.txt',
    'file10.part.2.section1.group8.txt',
    'file1.txt',
    'file11.part.1.txt'
  ];

  fileNames.sort((a, b) {
    // Extract all numbers from file names
    List<int> numA = RegExp(r'\d+').allMatches(a).map((e) => int.parse(e.group(0)!)).toList();
    List<int> numB = RegExp(r'\d+').allMatches(b).map((e) => int.parse(e.group(0)!)).toList();

    // Compare each part of the numbers
    for (int i = 0; i < numA.length && i < numB.length; i++) {
      int comparison = numA[i].compareTo(numB[i]);
      if (comparison != 0) {
        return comparison;
      }
    }

    // If all compared parts are equal, compare lengths (e.g., shorter comes first)
    return numA.length.compareTo(numB.length);
  });

  print(fileNames);
}
