import 'package:flutter/material.dart';


/*
* remove inkwell
* target : inkwell bug ,when you click some widget who has inkwell attribute,
* sometimes the inkwell will not disappear after click.
* */

class NoInkwellFactory extends InteractiveInkFeatureFactory{

  const NoInkwellFactory();

  @override
  InteractiveInkFeature create({MaterialInkController controller, RenderBox referenceBox, Offset position, Color color, TextDirection textDirection, bool containedInkWell = false, rectCallback, BorderRadius borderRadius, ShapeBorder customBorder, double radius, onRemoved}) {
    // TODO: implement create
    return new NoInkwell(
      controller:controller,
      referenceBox:referenceBox
    );
  }

}


class NoInkwell extends InteractiveInkFeature{

  NoInkwell({@required MaterialInkController controller,@required RenderBox referenceBox})
    : assert (controller != null),
  assert(referenceBox != null),
  super(controller:controller,referenceBox:referenceBox);

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    // TODO: implement paintFeature
  }

}










