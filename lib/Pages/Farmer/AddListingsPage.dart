import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agrokart/main.dart';
import 'package:agrokart/Backend/Firebasee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddListings extends StatefulWidget {
  @override
  _AddListingsState createState() => _AddListingsState();
}

class _AddListingsState extends State<AddListings> {
  TextEditingController _crop, _price, _description, _quantity;
  @override
  void initState() {
    super.initState();
    _crop = TextEditingController(text: "");
    _price = TextEditingController(text: "");
    _description = TextEditingController(text: "");
    _quantity = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white.withOpacity(0.0),
        backgroundColor: Colors.white,
        title: Text(
          "Add a listing",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Color(0xff309a20),
                fontSize: GFS(25, context),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: TextField(
                        style: TextStyle(decoration: TextDecoration.none),
                        controller: _crop,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.07 *
                                  0.1,
                              left: 8.0),
                          labelText: "Crop Name",
                          hintText: "Enter the crop name",
                          border: OutlineInputBorder(),
                        ),
                        autocorrect: true,
                        maxLines: 1,
                        onSubmitted: (text) {
                          setState(() {
                            _crop.text = text;
                          });
                        }),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: TextField(
                        style: TextStyle(decoration: TextDecoration.none),
                        controller: _price,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.07 *
                                  0.1,
                              left: 8.0),
                          labelText: "Price per Kg",
                          hintText: "Enter the price/Kg",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        autocorrect: true,
                        maxLines: 1,
                        onSubmitted: (text) {
                          setState(() {
                            text = "Rs. " + text + " /Kg";

                            _price.text = text;
                          });
                        }),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: TextField(
                        style: TextStyle(decoration: TextDecoration.none),
                        controller: _description,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.07 *
                                  0.1,
                              left: 8.0),
                          labelText: "Description",
                          hintText: "Some info about your crop",
                          border: OutlineInputBorder(),
                        ),
                        autocorrect: true,
                        onSubmitted: (text) {
                          setState(() {
                            _description.text = text;
                          });
                        }),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Center(
                    child: TextField(
                        style: TextStyle(decoration: TextDecoration.none),
                        controller: _quantity,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.07 *
                                  0.1,
                              left: 8.0),
                          labelText: "Available stock",
                          hintText: "Stock available in Kgs",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        autocorrect: true,
                        onSubmitted: (text) {
                          setState(() {
                            text += " Kg";
                            _quantity.text = text;
                          });
                        }),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                database.collection("Listings").add({
                  "Name": auth.currentUser.displayName,
                  "phoneNumber": auth.currentUser.phoneNumber,
                  "Crop": _crop.text,
                  "Price": _price.text,
                  "Description": _description.text,
                  "Available Stock": _quantity.text,
                  "timestamp": FieldValue.serverTimestamp()
                });
                setState(() {
                  _quantity.text = "";
                  _price.text = "";
                  _description.text = "";
                  _crop.text = "";
                });
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34.0),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffcbf019),
                        const Color(0xff309a20)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0.5,
                          blurRadius: 2.0,
                          offset: Offset(0.0, 5.0))
                    ]),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: GFS(20, context),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
