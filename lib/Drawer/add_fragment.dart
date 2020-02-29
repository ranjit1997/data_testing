import 'package:flutter/material.dart';

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // implement build
     return Scaffold(
      // key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: formKey,
          child: Column(
            children: [
              new SizedBox(height: 50.0),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Country',
                contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

               TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'State',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'District',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'City',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Best Place',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {},
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(12),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}