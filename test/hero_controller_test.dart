import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:marvel_app/services/hero_controller.dart';

void main() {
  group('Controller Test', ()
  {
    HeroControllers heroController = HeroControllers();
    test('Scroll Test', ()async {
      var number = 0;
     var res= await heroController.getHeroList(number.toString());
     List<dynamic> list=res["results"];
      expect(list.length, 30);
    });
  });
}