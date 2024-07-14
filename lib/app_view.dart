import 'package:flutter/material.dart';
import 'package:mbank_app/screens/auth/views/auth_screen.dart';
import 'package:mbank_app/screens/home/views/home_screen.dart';
import 'package:mbank_app/screens/more/view/more_screen.dart';
import 'package:mbank_app/screens/payments/view/payments_screen.dart';
import 'package:mbank_app/screens/services/view/services_screen.dart';

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const PaymentsScreen(),
    const ServicesScreen(),
    const MoreScren()
  ];

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Mbank clone',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
        background: Colors.black54,
        onBackground: Colors.white,
        primary: Colors.green,
        secondary: Colors.grey.withOpacity(0.1)
      )),
      routes: {
        '/': (context) => Scaffold(
              body: _pages[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: _navigateBottomBar,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: "Главная"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.payment,
                      ),
                      label: "Платежи"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.supervised_user_circle_sharp,
                      ),
                      label: "Сервисы"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.more_outlined,
                      ),
                      label: "Еще"),
                ],
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                currentIndex: _selectedIndex,
              ),
            ),
        'auth': (context) => AuthScreen()
      },
      initialRoute: 'auth',
    );
  }
}
