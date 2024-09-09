import 'package:flutter/material.dart';
import 'package:tareas/classes/tareas.dart';
import 'package:tareas/widgets/stream.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _streamer = Streams();
  List<Tareas> listTareas = [];
  Tareas newTarea = Tareas(0, "", false);

  @override
  void initState() {
    super.initState();
    _streamer.startCounter(listTareas);
  }

  @override
  void dispose() {
    _streamer.dispose();
    super.dispose();
  }

  void delete(int index) {
    listTareas.removeAt(index);
    for (int i = 0; i < listTareas.length; i++) {
      listTareas[i].id = i + 1;
    }
    _streamer.startCounter(listTareas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tareas"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: StreamBuilder<List<Tareas>>(
          stream: _streamer.counterStream,
          builder: (context, snapshot) {
            listTareas = snapshot.data!;
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: buildListView(listTareas),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: () => showDialogAddTask(context),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text('Agregar nueva tarea'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget buildListView(List<Tareas> xList) {
    return ListView.builder(
      itemCount: xList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text('${xList[index].id}'),
            title: Text(xList[index].nombre),
            subtitle: Text(xList[index].estado ? 'Completado' : 'Pendiente',
                style: TextStyle(
                  color: xList[index].estado ? Colors.green : Colors.red,
                )),
            trailing: Wrap(
              spacing: 12,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    delete(index);
                    _streamer.startCounter(xList);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepOrangeAccent),
                  onPressed: () {
                    showDialogEditTask(context, index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: !xList[index].estado
                      ? () {
                          xList[index].estado = true;
                          _streamer.startCounter(xList);
                        }
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showDialogAddTask(BuildContext context) {
    String userInput = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Titulo de la Tarea:'),
          content: TextField(
            onChanged: (value) {
              userInput = value;
            },
            decoration: const InputDecoration(
              hintText: 'Ingrese el titulo aquí',
            ),
          ),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // ignore: unnecessary_string_interpolations
                newTarea = Tareas(listTareas.length + 1, '$userInput', false);
                listTareas.add(newTarea);
                _streamer.startCounter(listTareas);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save, color: Colors.white),
              label: const Text('Guardar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  void showDialogEditTask(BuildContext context, int index) {
    String userInput = listTareas[index].nombre;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Tarea:'),
          content: TextField(
            onChanged: (value) {
              userInput = value;
            },
            decoration: const InputDecoration(
              hintText: 'Ingrese el nuevo nombre aquí',
            ),
            controller: TextEditingController()..text = userInput,
          ),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                listTareas[index].nombre = userInput;
                _streamer.startCounter(listTareas);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save, color: Colors.white),
              label: const Text('Guardar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
