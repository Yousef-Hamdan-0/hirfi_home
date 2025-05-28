import 'package:flutter/material.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';

class ListSearch extends StatelessWidget {
  const ListSearch({super.key, required this.data, this.duplicateList});

  final List<Craftsman> data;
  final List<String>? duplicateList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: ListView.builder(
        itemCount: duplicateList?.length ?? data.length,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final craftsman = data[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: craftsman.picture != null
                    ? NetworkImage(craftsman.picture!)
                    : null,
                child: craftsman.picture == null ? Icon(Icons.person) : null,
              ),
              title: Text(craftsman.name),
              subtitle: Text(craftsman.occupationType ?? 'بدون تخصص'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(craftsman.rating?.toStringAsFixed(1) ?? '0.0'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
