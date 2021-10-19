import 'package:flutter/material.dart';
import 'package:pet_adopter/pet.dart';

class Category extends StatelessWidget {
  Color _color;
  String category_name;

  Category(this.category_name, this._color) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetPage(
                    category: category_name,
                  )));
        },
        child: Container(
          height: 70,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(
            right: 8,
            left: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    // child: Image.asset(

                    //   fit: BoxFit.fitHeight,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                '${category_name}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
