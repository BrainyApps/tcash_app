import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:provider/provider.dart';
import 'package:rnd_flutter_app/api_caller/validate_account.dart';
import 'package:rnd_flutter_app/pages/qr_code_widget.dart';
import 'package:rnd_flutter_app/provider/login_provider.dart';
import 'package:rnd_flutter_app/variables/transaction_types.dart';
import 'package:rnd_flutter_app/widgets/custom_appbar.dart';
import 'package:rnd_flutter_app/widgets/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rnd_flutter_app/pages/components/amount_confirm.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    _accountNumberController.dispose();
    super.dispose();
  }

  navigateToAmountConfirm(String personalAccount) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AmountConfirm(
              accountNo: personalAccount,
              transactionType: TransactionTypes.sendMoney),
        ),
      );
    });
  }

  validateAgentAccount(String personalAccount) async {
    setState(() {
      isLoading = true;
    });
    bool isValid = await AccountValidate().validatePersonal(personalAccount);

    if (isValid) {
      navigateToAmountConfirm(personalAccount);
    } else {
      setState(() {
        isLoading = false;
      });
      showToastNotValid();
    }
    // setState(() {
    //   isLoading = false;
    // });

  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = _accountNumberController.text;
      validateAgentAccount(phoneNumber);
      _accountNumberController.clear();
    }
  }

  void showToastNotValid() {
    Fluttertoast.showToast(
      msg: 'Personal account not valid',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthProvider>(context);
    final myNumber = authState.userDetails?.mobileNo;
    return Scaffold(
      appBar: const CustomAppBar(
          content: Text(
        "Send Money",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            controller: _accountNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Account Number',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your account number';
                              } else if (value.length != 11) {
                                return 'Account number must be 11 digits';
                              } else if (value == myNumber) {
                                return 'Account not a valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: const Icon(Icons.contacts),
                            onPressed: () async {
                              final PhoneContact contact =
                                  await FlutterContactPicker.pickPhoneContact();

                              final String? phoneNumber =
                                  contact.phoneNumber!.number;
                              if (phoneNumber != null) {
                                setState(() {
                                  _accountNumberController.text = phoneNumber;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Scan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 70,
                          child: ElevatedButton(
                            child: const Icon(Icons.qr_code),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const QRViewExample(),
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: CustomButton(
                        content: const Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: _submitForm,
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
