import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:traveller/app/features/add/add_page.dart';
import 'package:traveller/models/item_model.dart';
import 'package:traveller/repositories/items_repository.dart';

import 'cubit/second_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPageList extends StatelessWidget {
  const SecondPageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Your destinations List',
          ),
          backgroundColor: const Color.fromARGB(167, 38, 83, 128)),
      body: const ListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListBody extends StatelessWidget {
  const ListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecondPageCubit(ItemsRepository())..start(),
      child: BlocBuilder<SecondPageCubit, SecondPageState>(
          builder: (context, state) {
        final itemModels = state.items;
        if (itemModels.isEmpty) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bckb.jpg'), fit: BoxFit.cover),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 244, 244, 244).withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                    width: 5,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                height: 180,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  children: [
                    for (final itemModel in itemModels)
                      Dismissible(
                        key: ValueKey(itemModel.id),
                        background: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 32.0),
                              child: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          // only from right to left
                          return direction == DismissDirection.endToStart;
                        },
                        onDismissed: (direction) {
                          context
                              .read<SecondPageCubit>()
                              .remove(documentID: itemModel.id);
                        },
                        child: _ListViewItem(
                          itemModel: itemModel,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                  image: NetworkImage(
                    itemModel.imageURL,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemModel.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          itemModel.relaseDate.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        itemModel.daysLeft(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('days left'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
