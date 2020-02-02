import 'package:data_consult/user/bloc/bloc_user.dart';
import 'package:data_consult/user/model/user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserInfo extends StatelessWidget{
 
  User user;
  UserBloc userBloc;

  UserInfo(@required this.user);

  @override
  Widget build(BuildContext context) {
    
    
    
    //fotografia del usuario
    
    
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(
        right: 20.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
          style: BorderStyle.solid
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(user.photoURL)
        )
      ),
    );
    


    //Informacion

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 5.0,
          ),
          child: Text(
            user.name,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white
            )
          ),
        ),
        Text(
          user.email,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.white
            )
        )
      ],
    );



    userBloc = BlocProvider.of(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal:0.0, 
        vertical:20.0
      ),
      child: Row(
        children: <Widget>[
          userPhoto,
          userInfo
        ],
      ),
    );
  }

  
}