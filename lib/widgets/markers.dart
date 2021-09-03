import 'package:flutter/material.dart';

class CircleMarker extends StatelessWidget {
  final Color color;

  const CircleMarker({required Key key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
              color: color ?? Theme.of(context).accentColor, width: 2)),
    );
  }
}

class TargetCircleMarker extends StatelessWidget {
  final double spreadsize;
  final Color color;

  const TargetCircleMarker({required Key key, required this.color, this.spreadsize = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (color ?? Theme.of(context).accentColor)
                      .withOpacity(0.5)),
            ),
            SizedBox(
              height: constraints.maxHeight - spreadsize,
              width: constraints.maxWidth - spreadsize,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color ?? Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PointOfInterestMarker extends StatelessWidget {
  final Color color;
  final Function() onTapCallback;

  const PointOfInterestMarker(
      {required Key key, required this.color, required this.onTapCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTapCallback,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                color: color ?? Theme.of(context).accentColor, width: 2)),
      ),
    );
  }
}

class TripPOIMarker extends StatelessWidget {
  final Color color;
  final int order;

  const TripPOIMarker({required Key key, required this.color, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.clip,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                  color: color ?? Theme.of(context).accentColor, width: 2)),
        ),
        Transform.translate(
          offset: Offset(0, -1),
          child: Text(
            '$order',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class TripOriginMarker extends StatelessWidget {
  final Color color;

  const TripOriginMarker({required Key key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        )),
        Transform.translate(
          offset: Offset(-3, -3),
          child: Icon(
            Icons.play_circle_outline,
            color: const Color(0xFF666666),
            size: 25,
          ),
        ),
      ],
    );
  }
}

class TripDestinationMarker extends StatelessWidget {
  final Color color;

  const TripDestinationMarker({required Key key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-1, -14),
      child: Icon(
        Icons.place,
        color: color ?? Theme.of(context).accentColor,
        size: 32,
      ),
    );
  }
}
