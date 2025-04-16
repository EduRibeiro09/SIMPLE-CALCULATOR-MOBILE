import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Display extends StatelessWidget {
  final String expression;
  final String result;
  final bool isResultCalculated;

  const Display({
    super.key,
    required this.expression,
    required this.result,
    required this.isResultCalculated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(48, 48, 48, 1),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 60,),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                expression,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white70,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                isResultCalculated ? result : '',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

