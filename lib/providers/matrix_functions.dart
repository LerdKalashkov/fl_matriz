import 'package:flutter/material.dart';
import 'dart:math';

class MatrixFunctionsProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<List<int>> _matrz = [];
  var random = Random();
  List index = [];
  String nums = '';
  int _counter = 0;

  List<List<int>> get matrz => _matrz;
  set matrz(matrz) {
    _matrz = matrz;
    notifyListeners();
  }

  int get counter => _counter;
  set counter(counter) {
    _counter = counter;
    notifyListeners();
  }

  int _num = 2;
  int get num => _num;
  set num(int num) {
    _num = num;
    notifyListeners();
  }

  



  create() {
    num = int.parse(nums);
    int m = num;
    int n = num;
    matrz = List.generate(
        m, (i) => List.generate(n, (j) => random.nextInt(1 + 1)),
        growable: false);
  }

  searchIslands() {
    void walker(List<List<int>> mat, int i, int j, List<List<bool>> visited) {
      int m = mat.length, n = mat[0].length;
      if (i < 0 || j < 0 || i > m - 1 || j > n - 1 || visited[i][j]) return;
      if (mat[i][j] != 1) return;
      mat[i][j] = 0;
      visited[i][j] = true;
      walker(mat, i - 1, j, visited);
      walker(mat, i + 1, j, visited);
      walker(mat, i, j - 1, visited);
      walker(mat, i, j + 1, visited);
    }

    int numOfIslands(mat) {
      var m = mat.length, n = mat[0].length;
      if (mat == null || m == 0 || n == 0) return 0;
      List<List<bool>> visited = [];
      visited = List.generate(m, (i) => List.generate(n, (j) => false),
          growable: false);
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          if (mat[i][j] == 1) {
            counter++;
            walker(mat, i, j, visited);
          }
        }
      }
      // ignore: avoid_print
      print('Number of Islands $counter, $matrz');
      return _counter;
    }

    numOfIslands(matrz);
  }
}
