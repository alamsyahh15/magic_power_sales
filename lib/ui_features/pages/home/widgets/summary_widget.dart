import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class SummaryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int qty;
  final Map<String, int> calculationKarton;
  final String remainLabel;
  const SummaryWidget({
    super.key,
    required this.products,
    required this.qty,
    required this.calculationKarton,
    required this.remainLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                ...products.map((e) {
                  if (e['type_id'] == null) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        Row(children: [
                          Text("${e['product_name']}",
                              style: StyleAsset.paragraph3),
                          const Spacer(),
                          Text(
                            e['cal_karton'] == 0
                                ? "${e['cal_pieces'] ?? 0} PCS"
                                : e['cal_pieces'] == 0
                                    ? "${e['cal_karton']} CTN"
                                    : '${e['cal_karton']} CTN • ${e['cal_pieces'] ?? 0} PCS',
                            style: StyleAsset.paragraph3,
                          ),
                        ]),
                        const SizedBox(height: 16),
                        Divider(color: ColorAsset.grey),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 16),
                if (remainLabel.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    remainLabel,
                    textAlign: TextAlign.justify,
                    style: StyleAsset.paragraph3.copyWith(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 16),
        ]),
      ]),
    ]);
  }
}
