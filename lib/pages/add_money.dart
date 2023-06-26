import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:rnd_flutter_app/utils/country_list.dart';

class AddMoneyPage extends StatefulWidget {
  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _zipController = TextEditingController();

  final List<String> _countries = CountryList().countries;
  String _selectedCountry = '';

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _countryController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      String amount = _amountController.text;
      String name = _nameController.text;
      String cardNumber = _cardNumberController.text;
      String expiryDate = _expiryDateController.text;
      String cvv = _cvvController.text;
      String country = _countryController.text;
      String zip = _zipController.text;

      // TODO: Implement Stripe payment processing logic

      _amountController.clear();
      _nameController.clear();
      _cardNumberController.clear();
      _expiryDateController.clear();
      _cvvController.clear();
      _countryController.clear();
      _zipController.clear();
      setState(() {
        _selectedCountry = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Payment Amount',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the payment amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name on Card',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the card holder name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Card information',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    TextFormField(
                      controller: _cardNumberController,
                      maxLength: 16,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        hintText: "1234 1234 1234 1234",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter the card number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryDateController,
                        maxLength: 5,
                        decoration: const InputDecoration(
                          hintText: 'MM/YY',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the expiration date';
                          } else if (!RegExp(r'^\d{2}/\d{2}$')
                              .hasMatch(value!)) {
                            return 'Invalid date format';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 2 &&
                              !_expiryDateController.text.contains('/')) {
                            _expiryDateController.text = value + '/';
                            _expiryDateController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _expiryDateController.text.length));
                          } else if (value.length == 2 &&
                              _expiryDateController.text.contains('/')) {
                            _expiryDateController.text = value;
                            _expiryDateController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _expiryDateController.text.length));
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        controller: _cvvController,
                        maxLength: 4,
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the CVV';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TypeAheadFormField<String>(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _countryController,
                          decoration: const InputDecoration(
                            labelText: 'Country',
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                          ),
                        ),
                        suggestionsCallback: (pattern) async {
                          return _countries
                              .where((country) => country
                                  .toLowerCase()
                                  .startsWith(pattern.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          setState(() {
                            _selectedCountry = suggestion;
                            _countryController.text = suggestion;
                          });
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please select a country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _zipController,
                  decoration: const InputDecoration(
                    hintText: "ZIP",
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter the ZIP code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _processPayment,
                  child: Text('Pay'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
