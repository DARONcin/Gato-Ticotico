import "../config/config.dart";

class Controles extends StatefulWidget {
  final Function(estados) actualizarEstadisticas;
  const Controles({required this.actualizarEstadisticas, super.key});

  @override
  State<Controles> createState() => _ControlesState();
}

class _ControlesState extends State<Controles> {
  estados inicial = estados.cruz;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    double ancho, alto;
    ancho = MediaQuery.of(context).size.width;
    alto = MediaQuery.of(context).size.height;

    double tamanoTablero = ancho < alto ? ancho * 1 : alto * 1;

    return SizedBox(
      width: tamanoTablero,
      height: tamanoTablero,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Celda(
                    inicial: tablero[0],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(0),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[1],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(1),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[2],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(2),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Celda(
                    inicial: tablero[3],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(3),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[4],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(4),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[5],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Celda(
                    inicial: tablero[6],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(6),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[7],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(7),
                  ),
                ),
                Expanded(
                  child: Celda(
                    inicial: tablero[8],
                    alto: tamanoTablero / 3,
                    ancho: tamanoTablero / 3,
                    press: () => press(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void press(int index) {
    debugPrint("Pulsado");
    if (tablero[index] == estados.vacio) {
      tablero[index] = inicial;
      inicial = inicial == estados.cruz ? estados.circulo : estados.cruz;
      setState(() {});

      if (++contador >= 5) {
        estados? ganador = verificarGanador();
        if (ganador != null) {
          mostrarDialogoFin(ganador);
        } else if (contador == 9) {
          mostrarDialogoFin(estados.vacio); // Empate
        }
      }
    }
  }

  estados? verificarGanador() {
    for (int i = 0; i < tablero.length; i += 3) {
      if (iguales(i, i + 1, i + 2)) return tablero[i];
    }
    for (int i = 0; i < 3; i++) {
      if (iguales(i, i + 3, i + 6)) return tablero[i];
    }
    if (iguales(0, 4, 8)) return tablero[0];
    if (iguales(2, 4, 6)) return tablero[2];
    return null;
  }

  bool iguales(int a, int b, int c) {
    if (tablero[a] != estados.vacio) {
      if (tablero[a] == tablero[b] && tablero[b] == tablero[c]) {
        return true;
      }
    }
    return false;
  }

  void mostrarDialogoFin(estados ganador) {
    String mensaje;
    if (ganador == estados.cruz) {
      mensaje = "Las X ganan!";
    } else if (ganador == estados.circulo) {
      mensaje = "Las O ganan!";
    } else {
      mensaje = "Empate!";
    }

    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Juego Terminado'),
          content: Text(mensaje),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Continuar'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.actualizarEstadisticas(ganador);
                reiniciarTablero();
              },
            ),
            CupertinoDialogAction(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.actualizarEstadisticas(ganador);
                salirJuego();
              },
            ),
          ],
        );
      },
    );
  }

  void reiniciarTablero() {
    // Reiniciar solo los dibujos en el tablero
    setState(() {
      tablero = List.filled(9, estados.vacio);
    });
    contador = 0;
    inicial = estados.cruz;
  }

  void salirJuego() {
    exit(0);
  }
}
