import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/admin/Admin2.dart';

class Admin3 extends StatelessWidget {
  const Admin3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text('SafeShield'),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Admin2()),
                  );
                },
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FixedColumnWidth(50.0),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(100.0),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(child: Icon(Icons.person)),
                        TableCell(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Ammu'),
                        )),
                        TableCell(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text('Remove'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(child: Icon(Icons.person)),
                        TableCell(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Arati'),
                        )),
                        TableCell(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text('Remove'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(child: Icon(Icons.person)),
                        TableCell(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Anju'),
                        )),
                        TableCell(
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text('Remove'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

