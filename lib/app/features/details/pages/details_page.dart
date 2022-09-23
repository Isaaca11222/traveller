import 'package:flutter/material.dart';
import 'package:traveller/app/domain/models/item_model.dart';
import 'package:traveller/app/domain/repositories/items_repository.dart';

import 'package:traveller/app/features/details/cubit/details_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Your destinations List',
          ),
          backgroundColor: const Color.fromARGB(167, 38, 83, 128)),
      body: BlocProvider(
        create: (context) => DetailsCubit(ItemsRepository())..getItemWithID(id),
        child:
            BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
          final itemModel = state.itemModel;
          if (itemModel == null) {
            return const CircularProgressIndicator();
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
                    color: const Color.fromARGB(255, 244, 244, 244)
                        .withOpacity(0.7),
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
                      _ListViewItem(
                        itemModel: itemModel,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
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
                          itemModel.relaseDateFormated(),
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
