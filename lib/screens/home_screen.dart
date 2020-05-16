import 'package:flutter/material.dart';
import 'package:flutterpetadoptionui/data/mock-data.dart';

import 'adopt_pet_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildPetItem(int petId, String petName, String petDesc, String petImg) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, bottom: 30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: petId,
              child: Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(petImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 40.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    petName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => print('Favorite ${pets[0].name}'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
              child: Text(
                petDesc,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ]
      ),
    );
  }

  Widget _buildPetCategory(bool isSelected, String category) {
    return GestureDetector(
      onTap: () => print('Selected $category'),
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 80.0,
        decoration: BoxDecoration(
          color:
          isSelected ? Theme.of(context).primaryColor : Color(0xFFF8F2F7),
          borderRadius: BorderRadius.circular(20.0),
          border: isSelected
              ? Border.all(
            width: 8.0,
            color: Color(0xFFFED8D3),
          )
              : null,
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 40.0, top: 40.0),
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    height: 40.0,
                    width: 40.0,
                    image: AssetImage(owner.imageUrl),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(
                      Icons.add_location,
                      color: Colors.black,
                      size: 40.0,
                    ),
                  ),
                  labelText: 'Location',
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Divider(),
            ),
            Container(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 40.0),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      onPressed: () => print('Filters'),
                      icon: Icon(
                        Icons.search,
                        size: 35.0,
                      ),
                    ),
                  ),
                  _buildPetCategory(false, 'Cats'),
                  _buildPetCategory(true, 'Dogs'),
                  _buildPetCategory(false, 'Birds'),
                  _buildPetCategory(false, 'Other'),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                //print(index);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AdoptPetScreen(pet: pets[0]),
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  _buildPetItem(pets[0].id, pets[0].name, pets[0].description, pets[0].imageUrl),
                  _buildPetItem(pets[1].id, pets[1].name, pets[1].description, pets[1].imageUrl)
                ],
              )
            )
          ],
        )
    );
  }
}