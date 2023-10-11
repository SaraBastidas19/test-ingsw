import 'dart:html';

import 'package:flutter/material.dart';
import 'package:proyecto1/pagina2.dart';

void main() {
  runApp(MaterialApp(
    home: Pagina2(),
  ));
}

class Pagina2 extends StatefulWidget {
  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  bool areaPrivada = false;
  bool nuevo = false;

  TextStyle customTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontSize: 24.0,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CARACTERÍSTICAS',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 45.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff53B3C1),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff53B3C1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _buildDataRow('Coordenadas en X'),
                SizedBox(height: 20.0),
                _buildDataRow('Coordenadas en Y'),
                SizedBox(height: 20.0),
                _buildOptionRow('Área Privada', areaPrivada),
                SizedBox(height: 20.0),
                _buildOptionRow('Nuevo', nuevo),
                SizedBox(height: 40.0), // Espacio adicional antes del botón
                _buildCalculateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String labelText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: labelText == 'CARACTERÍSTICAS'
              ? TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                )
              : customTextStyle,
        ),
        SizedBox(width: 20.0),
        if (labelText == 'Coordenadas en X' || labelText == 'Coordenadas en Y')
          Container(
            width: 150, // Ancho fijo
            child: TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: 'Ingrese $labelText',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOptionRow(String labelText, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: labelText == 'CARACTERÍSTICAS'
              ? TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white,
                )
              : customTextStyle,
        ),
        SizedBox(width: 20.0),
        Row(
          children: [
            Text(
              'Sí',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (labelText == 'Área Privada') {
                    areaPrivada = value ?? false;
                  } else if (labelText == 'Nuevo') {
                    nuevo = value ?? false;
                  }
                });
              },
            ),
            Text(
              'No',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Radio(
              value: false,
              groupValue: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (labelText == 'Área Privada') {
                    areaPrivada = value ?? false;
                  } else if (labelText == 'Nuevo') {
                    nuevo = value ?? false;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Lógica para el botón "Calcular"
        },
        child: Text(
          'Calcular',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xff2986AE),
        ),
      ),
    );
  }
}
