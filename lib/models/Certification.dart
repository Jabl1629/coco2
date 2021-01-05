import 'package:flutter/material.dart';

class Certification {
  final String title,imageLoc,description;
  final int id;

  Certification(this.title, this.id, this.imageLoc, this.description);
}

List<Certification> certifications = [
  Certification('Certified Fair Trade', 1, 'assets/images/CFT.png', 'null for now'),
  Certification('Global Organic Textile Standard', 2, 'assets/images/GOTS.png', 'null for now'),
  Certification('Recycled 100 Claim Standard', 3, 'assets/images/rec100.png', 'null for now')
];

