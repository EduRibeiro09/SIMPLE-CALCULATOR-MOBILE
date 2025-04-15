import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final void Function(String) onPressed;

  const Buttons({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final numeros = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    final List<Map<String, dynamic>> buttons = [
      {'label': 'C', 'span': 1},
      {'label': '%', 'span': 1},
      {'label': '⌫', 'span': 1},
      {'label': '÷', 'span': 1},
      {'label': '7', 'span': 1},
      {'label': '8', 'span': 1},
      {'label': '9', 'span': 1},
      {'label': '×', 'span': 1},
      {'label': '4', 'span': 1},
      {'label': '5', 'span': 1},
      {'label': '6', 'span': 1},
      {'label': '-', 'span': 1},
      {'label': '1', 'span': 1},
      {'label': '2', 'span': 1},
      {'label': '3', 'span': 1},
      {'label': '+', 'span': 1},
      {'label': '0', 'span': 1},
      {'label': '.', 'span': 1},
      {'label': '=', 'span': 2},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children:
            buttons.map((btn) {
              final label = btn['label'];
              final span = btn['span'] ?? 1;

              return StaggeredGridTile.count(
                crossAxisCellCount: span,
                mainAxisCellCount: 1,
                child: ElevatedButton(
                  onPressed: () => onPressed(label.toString()),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    backgroundColor:
                        numeros.contains(label)
                            ? Colors.grey[800]
                            : const Color.fromARGB(255, 140, 0, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:
                      label == '⌫'
                          ? const Icon(Icons.backspace_outlined, size: 24,color: Colors.white,)
                          : Text(
                            label.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                                  GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                  ).fontFamily,
                              color: Colors.white,
                            ),
                          ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
