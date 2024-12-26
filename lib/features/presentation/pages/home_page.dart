import 'dart:developer';
import 'package:clean_artchitecture_weather_api_prac/features/presentation/bloc/weather_bloc.dart';
import 'package:clean_artchitecture_weather_api_prac/features/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(WeatherGetData(api:'https://api.openweathermap.org/data/2.5/weather?lat=31.561917&lon=74.348079&appid=3a9e26e60eb17ddc04e465e1f520dac4'));
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Lahore',style: TextStyle(color: Colors.white,
          decoration: TextDecoration.underline,
          decorationThickness: 1.0,
          decorationColor: Colors.white24
        ),
      textAlign:TextAlign.start,),
      titleSpacing:8,
      actions: [
       Container(height: 30,
         width: 30,
         margin: EdgeInsets.symmetric(horizontal: 10),
         alignment: Alignment.center,
         decoration: BoxDecoration(
         shape: BoxShape.circle,
         color: Colors.white
       ),
       child:  IconButton(
           padding: EdgeInsets.zero,
           onPressed:(){
             log('=====> button pressed');
            showDialog(context: context, builder:(context){
              return  Dialog(child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height:10,),
                  Text('Location',style: TextStyle(fontSize:20,fontWeight: FontWeight.w800),),
                    SizedBox(height:5,),
                   ListTile(
                     leading:Icon(Icons.auto_mode,size: 16,),
                     title:  Text('Auto Locate',style: TextStyle(fontSize:18,),),
                     minVerticalPadding:0,
                     minTileHeight:0,
                     onTap: (){
                       log('Auto Locate Tap');
                     Navigator.pop(context);
                       },),
                    Divider(),
                   ListTile(
                     leading: Icon(Icons.set_meal,size: 18,),
                     title:  Text('Manual Locate',style: TextStyle(fontSize:18,),),
                     minVerticalPadding:0,
                     minTileHeight:0,
                   ),
                    Divider(),
                    SizedBox(height:10,),
                  ],),
              ),);
            });
           }, icon:Icon(Icons.settings,size:20,color: Colors.grey,)),
       )
      ],),
      body: BlocConsumer<WeatherBloc, WeatherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is WeatherLoading){
      return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
    }
 else if(state is WeatherSuccess){
   return HomeWidget(weather: state.weather);
 }
 else if(state is WeatherInitial||state is WeatherFailure){
      return Container(
        height:MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text('an error occured'),
      );
    }
 else{return SizedBox();}
  },
),
    );
  }
}


