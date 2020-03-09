# five_star_rating
A rating package in flutter
Five star rating flutter package with hover effect

Examples

![one rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/vbadrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/badrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/goodrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/vgoodrating.png)

![two rating on hover](https://raw.githubusercontent.com/gagsy/five_star_rating/master/exrating.png)

You can change the color of start text hover background etc ...



##How To Use

import 'package:flutter/material.dart';
import 'package:five_star_rating/five_star_rating.dart';


In your Flutter project and use this widget
FiveStarRating(
          allowHalfRating: true,
          onRatingChanged: (v) {
            rating = v
            setState(() {});
          },
          intialrating: 1,
          size: 35.0,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          color: Colors.amber,
          borderColor: Colors.black,
          textColor: Colors.black,
          spacing:0.0
        ),
