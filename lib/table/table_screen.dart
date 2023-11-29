import 'package:api_calling_application/models/user_model.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {
  List<Data> dataList = [];
  MyDataTable({
    super.key,
    required this.dataList,
  });

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  UserModel? userImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Contact')),
            DataColumn(label: Text('Profile Pic')),
          ],
          rows: widget.dataList
              .map(
                (data) => DataRow(
                  cells: [
                    DataCell(Text(data.name ?? '')),
                    DataCell(Text(data.email ?? '')),
                    DataCell(Text(data.contact ?? '')),
                    DataCell(
                      CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'http://thetimes.co.in/attendence/public/images/${data.profilePic}',
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.person);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
