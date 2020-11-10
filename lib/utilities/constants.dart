import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 140.0,
);

const kDayTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 40.0,
);
const kCityNameTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 55.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Open Sans',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kBackgroundBoxDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/location_background.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
  ),
);
