import 'package:data_consult/global_widgets/circle_button.dart';
import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/ui/screens/profile_header.dart';
import 'package:data_consult/user/ui/widgets/button_green.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Profile extends StatelessWidget{


  UserBloc userBloc;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  userBloc = BlocProvider.of(context);

    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
        left: 20.0,
        right: 20.0,
      ),
      height: 250.0,

      color: Colors.blueAccent,

      child: Column(
        children: <Widget>[
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            /*Expanded(
              child: Text(
          "Profile Page is under construction",
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              ),
            ),*/
            CircleButton(()=>userBloc.signOut(), true, Icons.exit_to_app, 25.0, Colors.blueGrey), 
            
          ],
      ),
    ProfileHeader(),
        ],
      ),
      
    
    );
  }
  
}