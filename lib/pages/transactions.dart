import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rnd_flutter_app/api_caller/transactions.dart';
import 'package:rnd_flutter_app/provider/login_provider.dart';
import 'package:rnd_flutter_app/routes/app_routes.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  String currentFilter = 'ALL';
  String? mobileNumber = '';
  List transactions = [];
  bool isLoading = false;
  List<dynamic> transactionList = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = Provider.of<AuthProvider>(context, listen: false);
      final user = authState.userDetails;
      final accountNumber = user?.mobileNo;
      mobileNumber = accountNumber;
      fetchTransactionHistory(accountNumber);
    });
  }

  Future<void> fetchTransactionHistory(accountNumber) async {
    setState(() {
      isLoading = true;
    });
    final transactions =
        await Transaction().fetchTransactionsByAccount(accountNumber);
    transactionList = transactions.map((data) {
      final isSenderAccount = data['senderAccount'] == accountNumber;
      final userName = isSenderAccount
          ? data['receiverName'] ?? data['receiverAccount'] ?? ''
          : data['senderName'] ?? data['senderAccount'] ?? '';
      final type = isSenderAccount
          ? data['senderTransactionType']
          : data['receiverTransactionType'];
      final amount =
          isSenderAccount ? (data['amount'] + data['fee']) : data['amount'];
      final isIncome = !isSenderAccount;
      final date =
          DateTime.parse(data['createdAt']).add(const Duration(hours: 6));
      return TransactionItem(
        type: type,
        userName: userName,
        amount: amount.toDouble(),
        isIncome: isIncome,
        date: date,
      );
    }).toList();
    setState(() {
      isLoading = false;
    });
  }


  Future<void> refreshPage() async {
    await fetchTransactionHistory(mobileNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
        ),
        title: const Text('Transaction History'),
      ),
        body: LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: refreshPage,
          // showChildOpacityTransition: false,
          child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: buildFilterButton('ALL'),
                ),
                Expanded(
                  child: buildFilterButton('IN'),
                ),
                Expanded(
                  child: buildFilterButton('OUT'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: transactionList.length,
                    itemBuilder: (context, index) {
                      final transaction = transactionList[index];

                      if (currentFilter == 'IN' && !transaction.isIncome) {
                        return const SizedBox.shrink();
                      } else if (currentFilter == 'OUT' &&
                          transaction.isIncome) {
                        return const SizedBox.shrink();
                      }

                      return TransactionItemWidget(transaction: transaction);
                    },
                  ),
                ),
        ],
          ),
        )
    );
  }

  Widget buildFilterButton(String text) {
    final isSelected = currentFilter == text;
    final buttonColor = isSelected ? Colors.white : Colors.grey[200];
    final textColor = isSelected ? Colors.black : Colors.grey;

    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
      child: TextButton(
        onPressed: () {
          setState(() {
            currentFilter = text;
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: Colors.grey),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TransactionItem {
  final String type;
  final String userName;
  final double amount;
  final bool isIncome;
  final DateTime date;

  TransactionItem({
    required this.type,
    required this.userName,
    required this.amount,
    required this.isIncome,
    required this.date,
  });
}

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionItemWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = transaction.isIncome ? Colors.green : Colors.red;
    final formattedDate = DateFormat("MMM d, hh:mm a").format(transaction.date);

    return Column(
      children: [
        ListTile(
          leading: Icon(
            transaction.isIncome ? Icons.arrow_forward : Icons.arrow_back,
            color: iconColor,
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  transaction.type,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(
                  transaction.userName,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '৳${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: transaction.isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formattedDate,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 1.0,
        ),
      ],
    );
  }
}

// Dummy data for testing
// final List<TransactionItem> transactionList = List.generate(
//   20,
//   (index) => TransactionItem(
//     type: 'Payment',
//     userName: 'User ${index + 1}',
//     amount: (index + 1) * 10.0,
//     isIncome: index % 2 == 0,
//     date: DateTime.now(),
//   ),
// );
