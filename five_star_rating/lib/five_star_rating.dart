library five_star_rating;

import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

 class FiveStarRating extends StatefulWidget {
   FiveStarRating({
    Key key,
    this.starCount = 5,
    this.spacing = 0.0,
    this.intialrating = 0.0,
    this.defaultIconData,
    this.onRatingChanged,
    this.color,
    this.hovercolor = Colors.brown,
    this.borderColor,
    this.textColor = Colors.black,
    this.size = 25,
    this.filledIconData = Icons.star,
    this.halfFilledIconData = Icons.star_half,
    this.allowHalfRating = true,
  }) {
    assert(this.intialrating != null);
  }
  final int starCount;
  final double intialrating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final Color hovercolor;
  final Color borderColor;
  final Color textColor;
  final double size;
  final bool allowHalfRating;
  final IconData filledIconData;
  final IconData halfFilledIconData;
  final IconData
      defaultIconData; //this is needed only when having fullRatedIconData && halfRatedIconData
  final double spacing;
  Widget stars;
  @override
  _FiveStarRating createState() {
    return _FiveStarRating();
  }
}

class _FiveStarRating extends State<FiveStarRating> {
  var mesg = '';
  double _currentRating;
  void initState() {
    super.initState();

    if (widget.allowHalfRating) {
      _currentRating = widget.intialrating;
    } else {
      _currentRating = widget.intialrating.roundToDouble();
    }
    _defaulttext(widget.intialrating);
  }

  void _chnagetext(index) {
    String text = '';
    if (index == 0) text = 'Very Bad';
    if (index == 1) text = 'Bad';
    if (index == 2) text = 'Good';
    if (index == 3) text = 'Very Good';
    if (index == 4) text = 'Excellent';
    setState(() => mesg = text);
  }

  void _defaulttext(initialrating) {
    String text = '';
    if (widget.allowHalfRating) {
      if (initialrating >= 0.5) text = 'Very Bad';
      if (initialrating >= 1.5) text = 'Bad';
      if (initialrating >= 2.5) text = 'Good';
      if (initialrating >= 3.5) text = 'Very Good';
      if (initialrating >= 4.5) text = 'Excellent';
    } else {
      if (initialrating == 1) text = 'Very Bad';
      if (initialrating == 2) text = 'Bad';
      if (initialrating == 3) text = 'Good';
      if (initialrating == 4) text = 'Very Good';
      if (initialrating == 5) text = 'Excellent';
    }
    setState(() => mesg = text);
  }

  @override
  Widget build(BuildContext context) {
    var stars = new Wrap(
      alignment: WrapAlignment.start,
      spacing: widget.spacing,
      children: new List.generate(
          widget.starCount, (index) => buildStar(context, index)),
    );

    return new Material(
      color: Colors.transparent,
      child: Container(
        padding: new EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                stars,
                SizedBox(width: 10),
                Text(
                  '$mesg',
                  style: TextStyle(
                      fontSize: widget.size - 18, color: widget.textColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    var icon;
    var arr = ['Very Bad', 'Bad', 'Good', 'Very Good', 'Exellent'];
    double rating;
    rating = _currentRating;
    var stars;

    if (index >= rating) {
      stars = new Icon(
        widget.defaultIconData != null
            ? widget.defaultIconData
            : Icons.star_border,
        color: widget.borderColor ?? Theme.of(context).primaryColor,
        size: widget.size,
      );
    } else if ((index > rating - (widget.allowHalfRating ? 0.5 : 1.0)) ||
        (index < rating && (rating == index + 0.5))) {
      stars = new Icon(
        widget.halfFilledIconData != null
            ? widget.halfFilledIconData
            : Icons.star_half,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.size,
      );
    } else {
      stars = new Icon(
        widget.filledIconData != null ? widget.filledIconData : Icons.star,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.size,
      );
    }

    icon = TooltipTheme(
      data: TooltipThemeData(
        decoration: BoxDecoration(
          color: widget.hovercolor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Tooltip(
        message: arr[index],
        child: stars,
      ),
    );

    return new GestureDetector(
      onTap: () {
        if (widget.onRatingChanged != null) {
          setState(() => _currentRating = index.toDouble() + 1.0);
          widget.onRatingChanged(_currentRating);
        }
        _chnagetext(index);
      },
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject();
        var _pos = box.globalToLocal(dragDetails.globalPosition);
        var i = _pos.dx / widget.size;
        var newRating = widget.allowHalfRating ? i : i.round().toDouble();
        if (newRating > widget.starCount) {
          newRating = widget.starCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (widget.onRatingChanged != null) widget.onRatingChanged(newRating);
      },
      child: icon,
    );
  }
}
