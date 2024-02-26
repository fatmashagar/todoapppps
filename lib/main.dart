import 'package:flutter/material.dart';
import 'package:todoapppps/sqldb.dart';
import 'package:todoapppps/sqldb.dart';

import 'sqldb.dart';

class todoapp extends StatefulWidget {
   todoapp({super.key});

  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
SqlDb sqlDb=SqlDb();
Future<List<Map>>readdata()async{
  List<Map> response =await sqlDb.readData("select * from notes");
return response;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: [
FutureBuilder(future: readdata(), builder: (context,AsyncSnapshot<List<Map>> snapshot) {
  if (snapshot.hasData) {

    ListView.builder(itemCount: snapshot.data!.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,i){
      return ListTile(
        title:Text( snapshot.data![i]['note']),
      );
    });
  }
  return Center(
    child: CircularProgressIndicator(),
  );
})],
        ),
      )
    );
  }
}
void main(){
  runApp(MaterialApp(home: todoapp(),));
}
