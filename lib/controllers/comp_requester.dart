import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coco2/models/comp.dart';

class CompRequester{
  Future<List<Comp>> getComps() async {
    try {
      var response = await http.get(
          "http://www.json-generator.com/api/json/get/ceWOeidrxe?indent=2");
      if (200 == response.statusCode) {
        var jsonData = json.decode(response.body);
        List<Comp> comps = [];
        print(jsonData);
        for (var i in jsonData) {
          Comp comp = Comp(
              i["id"], i["title"], i["imageA"], i["imageB"], i["description"], i["ismen"],
              i["category"]);
          comps.add(comp);
          //TODO: Update JSON with new image URLs so images A and B are different (also need to add in image B below)
        }
        print(comps.length);
        return comps;
      }
      else{
        var comps = [];
        return comps;
      }
    } catch (e) {
      print(e);
    }
  }
  }