import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DemoPayment extends StatefulWidget {
  const DemoPayment({super.key});

  @override
  State<DemoPayment> createState() => _DemoPaymentState();
}

class _DemoPaymentState extends State<DemoPayment> {
  final Razorpay _razorpay = Razorpay();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("SUCCESS");

    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Payment not Success ")));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: name,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: price,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    hintText: "Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  var options = {
                    'key': 'rzp_live_ILgsfZCZoFIKMb',
                    'amount': price.text  ,
                    'name': name.text,
                    'description': 'Fine T-Shirt',
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    }
                  };

                  _razorpay.open(options);
                },
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
