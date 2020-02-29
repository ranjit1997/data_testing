import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SecondFragment extends StatefulWidget {
  @override
  _SecondFragmentState createState() => _SecondFragmentState();
}

class Country{
  String key;
  String countrys;
  String state;
  String district;
  String city;
  String place;

  Country(this.countrys, this.state, this.district, this.city, this.place);

  Country.fromSnapshot(DataSnapshot snapshot)
  : key = snapshot.key,
    countrys = snapshot.value["countrys"],
    state= snapshot.value["state"],
    district = snapshot.value["district"],
    city = snapshot.value["city"],
    place = snapshot.value["place"];
    
    toJson(){
      return{
        "countrys": countrys,
        "state": state,
        "district": district,
        "city": city,
        "place": place,
      };
    }
}

class _SecondFragmentState extends State<SecondFragment> {
 List<Country> countrys = List();
  Country item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Country("", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  
    itemRef = database.reference().child('User_Info');
    // itemRef.onChildAdded.listen(_onEntryAdded);
    // itemRef.onChildChanged.listen(_onEntryChanged);
  }

  // _onEntryAdded(Event event) {
  //   setState(() {
  //     User_Info.add(Country.fromSnapshot(event.snapshot));
  //   });
  // }

  // _onEntryChanged(Event event) {
  //   var old = User_Info.singleWhere((entry) {
  //     return entry.key == event.snapshot.key;
  //   });
  //   setState(() {
  //     User_Info[User_Info.indexOf(old)] = Country.fromSnapshot(event.snapshot);
  //   });
  // }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    // implement build
     return Scaffold(
      // key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              new SizedBox(height: 50.0),
              TextFormField(
                 initialValue: "",
                 onSaved: (val) => item.countrys = val,
                 validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'Country',
                contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

               TextFormField(
                initialValue: "",
                onSaved: (val) => item.state = val,
                validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'State',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                initialValue: "",
                onSaved: (val) => item.district = val,
                validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'District',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                initialValue: "",
                onSaved: (val) => item.city = val,
                validator: (val) => val == "" ? val : null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                hintText: 'City',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
              ),

              TextFormField(
                initialValue: '',
                onSaved: (val) => item.place = val,
                validator: (val) => val == "" ? val : null,
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
                onPressed: () {
                  handleSubmit();
                },
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