import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:fl_matriz/providers/providers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matrix = Provider.of<MatrixFunctionsProvider>(context);

    int main = matrix.matrz.length;
    List crs = matrix.index;
    int cross = 0;

    for (var row in matrix.matrz) {
      cross = cross + row.length;
      crs.addAll(row);
      log(row.toString());
    }

    log('Matrix Index CRS - $crs');
    log(cross.toString());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(child: Text('Matriz')),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(20),
            child: _GridView(main: main, cross: cross, crs: crs),
          ),
          const SizedBox(height: 25),
          Text('Number of islands: ${matrix.counter}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 24,
              )),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: _MaterialButton(matrix: matrix),
          )
        ])));
  }
}

class _MaterialButton extends StatelessWidget {
  const _MaterialButton({
    Key? key,
    required this.matrix,
  }) : super(key: key);

  final MatrixFunctionsProvider matrix;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.deepPurple,
        onPressed: () {
          log(matrix.matrz.toString());
          FocusScope.of(context).unfocus();
          matrix.searchIslands();
        },
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            child: const Text(
              'Search Islands',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ));
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    Key? key,
    required this.main,
    required this.cross,
    required this.crs,
  }) : super(key: key);

  final int main;
  final int cross;
  final List crs;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: main,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: List.generate(cross, ((index) => MatrixButtom(crs[index]))),
    );
  }
}

// ignore: must_be_immutable
class MatrixButtom extends StatelessWidget {
  MatrixButtom(this.indx, {super.key});

  int indx;

  @override
  Widget build(BuildContext context) {
    final matrix = Provider.of<MatrixFunctionsProvider>(context);
    final change = Provider.of<ButtomColoursProvider>(context);

    Color colour;
    Icon icon;

    if (indx != 1) {
      colour = Colors.deepPurple;
    } else {
      colour = Colors.green;
    }

    if (indx != 1) {
      icon = const Icon(Icons.waves_rounded);
    } else {
      icon = const Icon(Icons.terrain_rounded);
    }

    id() {
      int cross = 0;
      List list;
      List<List<int>> mtz;
      List row = [];
      for (var row in matrix.matrz) {
        cross = row.length;
        row.insert(row.length, indx);

        mtz = List.generate(matrix.matrz.length, (i) => row);
        mtz = matrix.matrz;

        log('Matrix Genered $mtz');
        log('Original Matrix ${matrix.matrz}');
      }
    }

    changes(index) {
      if (index != 1) {
        colour = change.colour;
        change.colour = Colors.deepPurple;
      } else {
        colour = change.colour;
        change.colour = Colors.green;
      }

      if (index != 1) {
        icon = change.icon;
        change.icon = const Icon(Icons.waves_rounded);
      } else {
        icon = change.icon;
        change.icon = const Icon(Icons.terrain_rounded);
      }
    }

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: colour,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          if (indx != 1) {
            indx = 1;
          } else {
            indx = 0;
          }

          id();
          changes(indx);
          log(indx.toString());
        },
        child: Center(
          child: icon,
        ));
  }
}
