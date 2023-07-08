import 'package:cripto_exchange_ui/modules/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cripto_exchange_ui/mocks/transactions_Data.dart';
import 'package:cripto_exchange_ui/theme/current_theme.dart';

class TransactionsListModule extends StatelessWidget {
  const TransactionsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...transactionsData.map((e) {
        final rowDate = e["date"] as DateTime;
        final date =
            '${rowDate.day} / ${rowDate.month} / ${rowDate.year} ${rowDate.hour}:${rowDate.minute}';
        return Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: CurrentTheme.textColor.withOpacity(0.1)))),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => TransactionDetailsModule());
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          height: 3,
                          width: 10,
                          color: getStatus(e),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getStatusText(e),
                            style: const TextStyle(
                                color: CurrentTheme.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: GestureDetector(
                              onLongPress: () {
                                Clipboard.setData(ClipboardData(
                                    text: e["address"] as String));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Address copied",
                                          style: TextStyle(fontSize: 16),
                                        )));
                              },
                              child: Text(
                                e["address"] as String,
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        CurrentTheme.textColor.withOpacity(0.6),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Date",
                            style: TextStyle(
                                color: CurrentTheme.textColor.withOpacity(0.5),
                                fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${e['amount']}",
                        style: const TextStyle(
                            color: CurrentTheme.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "BTC ≈ ${e['amount']}",
                        style: TextStyle(
                            color: CurrentTheme.textColor.withOpacity(0.6),
                            fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        date,
                        style: TextStyle(
                            color: CurrentTheme.textColor.withOpacity(0.6),
                            fontSize: 12),
                      )
                    ],
                  )
                ]),
          ),
        );
      }).toList()
    ]);
  }

  getStatus(Map<String, Object> e) {
    if (e["status"] == "success") {
      return const Color(0xff02FF63);
    }
    if (e["status"] == "pending") {
      return const Color(0xffFFC571);
    }
    if (e["status"] == "rejected") {
      return const Color(0xffFF467F);
    }
  }

  getStatusText(Map<String, Object> e) {
    if (e["status"] == "success") {
      return "Successful";
    }
    if (e["status"] == "pending") {
      return "Pending";
    }
    if (e["status"] == "rejected") {
      return "Rejected";
    }
  }
}
