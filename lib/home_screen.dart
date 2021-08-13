import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:oportunidadesnegocio/usuario_cinco.dart';
import 'package:oportunidadesnegocio/usuario_cuatro.dart';
import 'package:oportunidadesnegocio/usuario_seis.dart';
import 'package:oportunidadesnegocio/usuario_tres.dart';
import 'package:oportunidadesnegocio/usuario_uno.dart';
import 'package:oportunidadesnegocio/usuario_dos.dart';

List list = [
  {"Jazael"},
  {"Maria"},
  {"Eva"},
  {"Perla"},
  {"Jose"},
  {"Antonio"},
];
List _datos = [
  {"id": 1, "title": "Jazael", "group": "A", "ent": "BIM"},
  {"id": 2, "title": "Maria", "group": "A", "ent": "BIM"},
  {"id": 3, "title": "Eva", "group": "B", "ent": "Nestle"},
  {"id": 4, "title": "Perla", "group": "B", "ent": "Nestle"},
  {"id": 5, "title": "Jose", "group": "C", "ent": "Tamsa"},
  {"id": 6, "title": "Antonio", "group": "C", "ent": "Tamsa"},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff43537e),
        actions: [
          Container(
            child: Align(
                alignment: Alignment.center,
                child: Text("Oportunidades de negocio",
                    style:
                        TextStyle(fontWeight: FontWeight.w100, fontSize: 20))),
            width: 386,
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff5880aa), Color(0xff43537e)])),
          ),
          Icon(Icons.search),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GroupedListView<dynamic, String>(
            elements: _datos,
            groupBy: (item) => item['group'],
            groupSeparatorBuilder: (groupValue) => Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            groupValue,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff5880aa)),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color(0xff43537e),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemBuilder: (context, item) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    switch ('${item['id']}') {
                      case "1":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsuarioUno()),
                        );
                        break;
                      case "2":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsuarioDos()),
                        );
                        break;
                      case "3":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsuarioTres()),
                        );
                        break;
                      case "4":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsuarioCuatro()),
                        );
                        break;
                      case "5":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsuarioCinco()),
                        );
                        break;
                      case "6":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsuarioSeis()),
                        );
                        break;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRect(
                            child: Image(
                              image: NetworkImage(
                                  'https://img.icons8.com/pastel-glyph/2x/person-male--v2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.corporate_fare,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 8),
                                          child: Text('${item['ent']}'))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            groupComparator: (group1, group2) => group1.compareTo(group2),
            itemComparator: (item1, item2) =>
                item1['title'].compareTo(item2['title']),
            useStickyGroupSeparators: true,
            floatingHeader: false,
            order: GroupedListOrder.ASC,
          ),
        ],
      ),
    );
  }
}
