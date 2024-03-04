import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class PaymentInit extends StatefulWidget {
  final double amount;
  final String metroCard, source;
  final Map<String, dynamic> passedVals;

  // Default values for amount and key
  const PaymentInit({
    Key? key,
    this.amount = 0.0, // Default amount
    this.metroCard = '', // Default metroCard
    required this.passedVals,
    this.source = '', // Default source
  }) : super(key: key);

  @override
  State<PaymentInit> createState() => _PaymentInitState();
}

class _PaymentInitState extends State<PaymentInit> {
  final UpiIndia _upi = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
  );

  @override
  void initState() {
    _upi.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Widget displayApps(){
    if(apps == null){
      return const Center(
          child: CircularProgressIndicator()
      );
    }
    else if (apps!.isEmpty){
      return Center(
        child: Text("No App is setup!", style: header),
      );
    }
    else{
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 15),
            child: Wrap(
              children: apps!.map<Widget>((UpiApp app) {
                return GestureDetector(
                  onTap: () async{
                    await initiateTransaction(app)
                        .then((res) async {
                      String? transId = res.transactionId;
                      String? approvalRefNumber = res.approvalRefNo;
                      String? transRefId = res.transactionRefId;
                      String? status = res.status;
                      Map<String, dynamic> data = {
                        "user_id": FirebaseAuth.instance.currentUser!.uid,
                        "trans_amount": widget.amount,
                      };
                      if(status == UpiPaymentStatus.FAILURE){
                        if(widget.passedVals["source"] == "SmartCard"){
                          var extend = {
                            "trans_id": transId,
                            "approval_ref_number": approvalRefNumber,
                            "trans_ref_id": transRefId,
                            "metro_card_number": widget.metroCard
                          };
                          data.addAll(extend.cast<String, Object>());
                          await FirebaseFirestore.instance.collection("transaction_history").doc().set(data)
                              .then((res) {
                            Navigator.popUntil(context, (route) => false);
                            // Assuming a default navigation action
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Profile Menu")))));
                          });
                        }
                        else{
                          var extend = {
                            "source_station": widget.passedVals["source_station"],
                            "destination_station": widget.passedVals["destination_station"],
                            "date_and_time": DateTime.now(),
                            "valid_till": DateTime.now().add(const Duration(minutes: 45)),
                            "qr_url": "xyz"
                          };
                          data.addAll(extend);
                          await FirebaseFirestore.instance.collection("tickets").doc().set(data)
                              .then((res) {
                            Navigator.popUntil(context, (route) => false);
                            // Assuming a default navigation action
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Home Page")))));
                          });
                        }
                      }
                      else if(status == UpiPaymentStatus.SUBMITTED){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else{
                        Future.delayed(
                          const Duration(seconds: 5),
                              () {
                            Navigator.popUntil(context, (route) => false);
                            // Assuming a default navigation action
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Profile Menu")))));
                          },
                        );
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.redAccent,
                                title: Text(
                                  'PAYMENT FAILURE',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                content: SizedBox(
                                  width: 200.0,
                                  height: 150.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Your Payment Failed for some reason, please try again later',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                    });
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Image.memory(
                          app.icon,
                          height: 60,
                          width: 60,
                        ),
                        Text(
                          app.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upi.startTransaction(
      app: app,
      receiverUpiId: "nidhimn48@oksbi",
      receiverName: 'Pulkit Raina',
      transactionRefId: DateTime.now().millisecondsSinceEpoch.toString(),
      transactionNote: 'Trial Transaction!',
      amount: widget.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 15
              )
            ],
            color: Color.fromRGBO(65, 48, 166, 0.9019607843137255),
          ),
          child: displayApps(),
        ),
      ),
    );
  }
}
