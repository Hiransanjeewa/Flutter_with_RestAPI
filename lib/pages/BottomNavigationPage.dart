import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BottomNavigationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationPageState();
  }

}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_back),
                  Text('Go Back'),],
              )
              ,
              
            ),
          ],
        )
         ),
    );





    // return Center(
      
    //     child: TextButton(
    //       onPressed: () {
    //       Navigator.pop(context);
    //     }, 
    //     child: const Icon(Icons.arrow_back),
    //   ),
    //   );
  }
  
  
}