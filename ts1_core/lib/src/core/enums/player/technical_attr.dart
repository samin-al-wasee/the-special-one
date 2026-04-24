import 'package:ts1_core/src/core/enums/player/player_attribute_utils.dart';

enum TechnicalAttr {
  firstTouch('First Touch'),
  technique('Technique'),
  ballControl('Ball Control'),
  dribbling('Dribbling'),
  flair('Flair'),
  shortPassing('Short Passing'),
  passing('Short Passing'),
  crossing('Crossing'),
  longPassing('Long Passing'),
  setPieceDelivery('Set Piece Delivery'),
  finishing('Finishing'),
  longShots('Long Shots'),
  shotPower('Shot Power'),
  heading('Heading'),
  volleys('Volleys'),
  weakFootAccuracy('Weak Foot Accuracy'),
  tackling('Tackling'),
  marking('Marking'),
  intercepting('Intercepting'),
  gkHandling('GK Handling'),
  gkReflexes('GK Reflexes'),
  gkOneOnOnes('GK One On Ones'),
  gkKicking('GK Kicking'),
  gkCommandOfArea('GK Command Of Area'),
  gkAerialReach('GK Aerial Reach'),
  gkThrowing('GK Throwing'),
  gkPositioning('GK Positioning'),
  gkCommunication('GK Communication');

  const TechnicalAttr(this.label);
  final String label;
  static TechnicalAttr fromLabel(String value) => enumFromLabel(
    TechnicalAttr.values,
    (item) => item.label,
    value,
    'TechnicalAttr',
  );
  @override
  String toString() => label;
}
