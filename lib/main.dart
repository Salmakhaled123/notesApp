import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smalltask/cubit/cubit.dart';
import 'package:smalltask/sharedpref/cache.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/states.dart';
import 'modules/login.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  runApp( HomeScreen());
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>MyAppCubit()..createDatabase(),
      child: BlocConsumer<MyAppCubit,AppCubitStates>(
        builder:(context,state)=>MaterialApp(title: 'Notes App',
            theme: ThemeData(primarySwatch:Colors.indigo),
            debugShowCheckedModeBanner: false,
            home: SplashScreen()

        ) ,
        listener: (context,state){},

      ),
    );

  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
            children: [
          Expanded(child: Image.asset('assets/pencil.png'))
         ,
         const Text(
            'Notes App',
            style: TextStyle(color: Color(0xffA0C8FF),
                fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold),
          )
        ]),
        backgroundColor: Color(0xffffdbed),
splashIconSize: 150,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: Duration(seconds: 1),
        nextScreen: LoginScreen());
  }
}


