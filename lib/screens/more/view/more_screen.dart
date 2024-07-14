import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank_app/provider/provider.dart';
import 'package:mbank_app/screens/more/blocs/more_bloc.dart';
import 'package:provider/provider.dart';

class MoreScren extends StatefulWidget {
  const MoreScren({super.key});

  @override
  State<MoreScren> createState() => _MoreScrenState();
}

class _MoreScrenState extends State<MoreScren> {
  final controller = ScrollController();
  int offset = 20;
  final _moreBloc = MoreBloc(20);

  @override
  void initState() {
    _moreBloc.add(MoreEvent());
    // context.read<MyDataProvider>().getItems(offset);
    // controller.addListener(() {
    //   if(controller.position.maxScrollExtent==controller.offset){
    //     offset = 20+offset;
    //     context.read<MyDataProvider>().getItems(offset);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Еще",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[850]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.person_2_rounded,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Азаматов Азирет',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                      _moreBloc.add(MoreEvent());
                },
                child: const Text('fetch')),
            Expanded(
                child: BlocBuilder<MoreBloc, MoreState>(
              bloc: _moreBloc,
              builder: (context, state) {
                if (state is MoreLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.items.length + 1,
                    controller: controller,
                    itemBuilder: (context, index) {
                      if (index < state.items.length) {
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${index + 1}) Бренд - ${state.items[index].brand.toString()}',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Цена - ${state.items[index].price.toString()}',
                                        style: TextStyle(
                                            color: Colors.amber[400])),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Товар - ${state.items[index].product.toString()}'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
                // Consumer<MyDataProvider>(
                //   builder: (context, value, child) => ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: value.data.length+1,
                //     controller: controller,
                //     itemBuilder: (context, index) {
                //       if(index < value.data.length){
                //       return Column(
                //         children: [
                //           Container(
                //             width: double.infinity,
                //             margin: const EdgeInsets.only(bottom: 10),
                //             decoration: BoxDecoration(
                //                 color: Theme.of(context).colorScheme.secondary),
                //             child: Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text('${index+1}) Бренд - ${value.data[index].brand.toString()}',
                //                       style: TextStyle(
                //                           color: Theme.of(context)
                //                               .colorScheme
                //                               .primary)),
                //                   const SizedBox( height: 5,),
                //                   Text('Цена - ${value.data[index].price.toString()}',
                //                       style: TextStyle(color: Colors.amber[400])),
                //                   const SizedBox(height: 5,),
                //                   Text('Товар - ${value.data[index].product.toString()}'),
                //                 ],
                //               ),
                //             ),
                //           )
                //         ],
                //       );
                //       } else {
                //         return const Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Center(
                //             child: CircularProgressIndicator(),
                //           ),
                //         );
                //       }
                //     },
                //   ),
                // ),
                )
          ],
        ),
      ),
    );
  }
}
