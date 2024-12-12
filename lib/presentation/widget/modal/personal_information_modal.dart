import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class PersonalInformationModal {
  Future<String?> showModal(
      BuildContext context, String title, List<String> options) async {
    return await showModalBottomSheet<String?>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: appTheme.textTheme.titleMedium,
                  ),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close, color: Colors.grey,))
                ],
              ),

              const Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return _buildTile(
                      context, options[index], index == options.length - 1);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, String item, bool isLastItem) {
    return Column(
      children: [
        ListTile(
          title: Text(
            item,
            style: appTheme.textTheme.bodyMedium,
          ),
          onTap: () {
            Navigator.pop(context, item);
          },
        ),
        if (!isLastItem)
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
      ],
    );
  }
}
