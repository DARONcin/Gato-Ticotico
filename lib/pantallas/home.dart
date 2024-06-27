import "../config/config.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int victoriasX = 0;
  int victoriasO = 0;
  int empates = 0;

  void actualizarEstadisticas(estados ganador) {
    setState(() {
      if (ganador == estados.cruz) {
        victoriasX++;
      } else if (ganador == estados.circulo) {
        victoriasO++;
      } else {
        empates++;
      }
    });
  }

  void reiniciarJuego() {
    setState(() {
      // Reiniciar el estado del juego y los puntajes
      tablero = List.filled(9, estados.vacio);
      victoriasX = 0;
      victoriasO = 0;
      empates = 0;
    });
  }

  void limpiarTablero() {
    setState(() {
      // Solo reiniciar el estado del tablero
      tablero = List.filled(9, estados.vacio);
    });
  }

  void salirJuego() {
    SystemNavigator.pop();
    exit(0); // Cierra la aplicación
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tic-Tac-Toe'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String result) {
                if (result == 'Reiniciar') {
                  reiniciarJuego();
                } else if (result == 'Salir') {
                  salirJuego();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Reiniciar',
                  child: Text('Reiniciar'),
                ),
                const PopupMenuItem<String>(
                  value: 'Salir',
                  child: Text('Salir'),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("resources/imagenes/board.png"),
              Controles(
                actualizarEstadisticas: actualizarEstadisticas,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: reiniciarJuego,
                ),
                IconButton(
                  icon: Icon(Icons.restart_alt),
                  onPressed: limpiarTablero,
                ),
                Text('Las X: $victoriasX'),
                Text('Empates: $empates'),
                Text('Las O: $victoriasO'),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: salirJuego,
                ),
              ],
            ),
            ),
        );
    }
}