import 'package:flutter/material.dart';
import 'package:online/app/theme.dart';

class BankSelectionModal extends StatelessWidget {
  final Function(String) onBankSelected;

  const BankSelectionModal({super.key, required this.onBankSelected});

  @override
  Widget build(BuildContext context) {
    final List<String> banks = [
      'Bank Mandiri',
      'Bank BCA',
      'Bank Jateng',
      'Bank BRI',
      'Bank Aladin',
      'Bank Muamalat',
      'Bank Danamon'
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: banks.length,
              separatorBuilder: (context, index) => const Divider(thickness: 1, color: Colors.grey,),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(banks[index], style: appTheme.textTheme.bodyMedium,),
                  onTap: () {
                    onBankSelected(banks[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
