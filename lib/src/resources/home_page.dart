import 'package:flutter/material.dart';
import 'package:flutter_app_dog_api/src/bloc/dog_bloc.dart';
import 'package:flutter_app_dog_api/src/model/dog_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dogBloc = DogBloc();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: StreamBuilder(
          stream: dogBloc.dogStream,
          builder: (context,snapshot){
            if(snapshot.hasData){
//              if(snapshot.data == "start"){
//                return Center(
//                  child: CircularProgressIndicator(),
//                );
//              }
              List<DogModel> namesdog= snapshot.data;
              for(var item in namesdog){
                print(item.breedName.toString()+"-"+item.img.toString());
              }
              return ListView.separated(
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(namesdog.elementAt(index).breedName),
                      onTap: (){},
                    );
                  },
                  separatorBuilder: (context,index) => Divider(
                    height: 1,
                    color: Color(0xfff5f5f5),
                  ),
                  itemCount: namesdog.length);
            }
            else if(snapshot.hasError){
              print("has erro");
              return Container();
            }
            else {
              print("has erro 2");
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    dogBloc.dispose();
    super.dispose();
  }

}
