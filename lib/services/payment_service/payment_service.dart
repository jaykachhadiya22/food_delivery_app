import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  late Razorpay _razorpay;

  void paymentStatus(
      void Function(PaymentSuccessResponse response) handlePaymentSuccess,
      void Function(PaymentFailureResponse response) handlePaymentError,
      void Function(ExternalWalletResponse response) handleExternalWallet) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void openCheckout(int totalPayment) async {
    var options = {
      'key': 'rzp_test_5ZSJg4JeE0bdS9',
      'amount': totalPayment * 100,
      'name': 'Acme Corp..',
      'description': 'Food Item',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      // 'prefill': {
      //   'contact': '9428729168',
      //   'email': 'jaykachhadiya22@gmail.com'
      // },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
