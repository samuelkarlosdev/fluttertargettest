import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_target_test/app/modules/home/stores/list_store.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse('https://google.com.br');

  final listStore = ListStore();

  @override
  void initState() {
    listStore.getListItemShared();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1f5466),
                    Color(0xff2d958e),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 16,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Observer(
                              builder: (_) {
                                return ListView.separated(
                                  itemCount: listStore.listItem.length,
                                  itemBuilder: (_, index) {
                                    return ListTile(
                                      title: Text(
                                        listStore.listItem[index],
                                      ),
                                      onTap: () {},
                                      trailing: Wrap(
                                        spacing: 12, // space between two icons
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit_rounded,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              listStore.updateList(index);
                                            },
                                          ), // icon-1
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: ClipOval(
                                              child: Material(
                                                color:
                                                    Colors.red, // Button color
                                                child: InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Remover Item?"),
                                                          content: Text(
                                                              "Deseja realmente remover o item ${listStore.listItem[index]} da lista?"),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Cancelar'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Remover'),
                                                              onPressed: () {
                                                                listStore
                                                                    .removeList(
                                                                        index);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: const SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: IconTheme(
                                                      data: IconThemeData(
                                                          color: Colors.white),
                                                      child: Icon(Icons.close),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ) // icon-2
                                        ],
                                      ),
                                      //leading: const FlutterLogo(size: 30.0),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return const Divider();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: listStore.setNewListItem,
                      onEditingComplete: listStore.addList,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Digite seu texto",
                        hintStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  _launchUrl();
                },
                child: const Text(
                  "Política de Privacidade",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
