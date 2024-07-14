import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbank_app/screens/services/components/box.dart';
import 'package:mbank_app/screens/services/components/popular.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              "Сервисы",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4),
                          hintText: 'Поиск',
                          filled: true,
                          fillColor: Colors.grey[850],
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Box(), Box()],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Box(), Box()],
                  ),
                  const TabBar(tabs: [
                    Tab(
                      text: 'Популярные',
                    ),
                    Tab(text: 'Прочие'),
                  ]),
                    SizedBox(
                      height: 400,
                      child: TabBarView(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey[900],
                        ),
                          child:const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Popular(
                                    icon: Icons.car_crash,
                                    title: 'Перерегистрация авто'),
                                Popular(
                                    icon: Icons.accessibility_rounded,
                                    title: 'Государственная таможенная служба'),
                                Popular(
                                    icon: Icons.cell_tower_outlined,
                                    title: 'Тундук'),
                                Popular(
                                    icon: Icons.settings_input_antenna_rounded,
                                    title: 'Электронная подпись'),
                                Popular(
                                    icon: Icons.business_center_rounded,
                                    title: 'Mbusiness'),
                                Popular(
                                    icon: Icons.tab,
                                    title: 'Мой налог'),
                                Popular(
                                    icon: Icons.countertops,
                                    title: 'Судебная задолженность'),
                              ],
                            ),
                          )
                      ),
                      Container(
                        child: Center(
                          child: Text('second'),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
