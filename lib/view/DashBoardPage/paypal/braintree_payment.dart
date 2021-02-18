import 'package:flutter/material.dart';
// import 'package:flutter_braintree/flutter_braintree.dart';

class PaypalBraintree extends StatelessWidget {
  // void paypal() async {
  //   // final request = BraintreePayPalRequest(amount: '1.00');

  //   // BraintreePaymentMethodNonce result = await Braintree.requestPaypalNonce(
  //   //   'sandbox_5r58xvbk_sgn99qds3r3955ms',
  //   //   request,
  //   // );
  //   // if (result != null) {
  //   //   print('Nonce: ${result.nonce}');
  //   // } else {
  //   //   print('PayPal flow was canceled.');
  //   // }

  //   final request = BraintreeDropInRequest(
  //     clientToken: 'sandbox_mfbdgt7d_ddg53mm2cznrmmp4',
  //     // collectDeviceData: true,
  //     // googlePaymentRequest: BraintreeGooglePaymentRequest(
  //     //   totalPrice: '4.20',
  //     //   currencyCode: 'USD',
  //     //   billingAddressRequired: false,
  //     // ),
  //     paypalRequest: BraintreePayPalRequest(
  //       amount: '1.00',
  //       currencyCode: 'USD',
  //       displayName: 'Example company',
  //     ),
  //   );
  //   BraintreeDropInResult result = await BraintreeDropIn.start(request);
  //   if (result != null) {
  //     print('Nonce: ${result.paymentMethodNonce.nonce}');
  //   } else {
  //     print('Selection was canceled.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // paypal();
          },
        ),
      ),
    );
  }
}
