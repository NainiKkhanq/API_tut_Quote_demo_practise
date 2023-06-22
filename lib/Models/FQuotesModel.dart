import 'dart:convert';
/// q : "We must not sit down and wait for miracles. Up and be going!"
/// a : "John Eliot"
/// c : "60"
/// h : "<blockquote>&ldquo;We must not sit down and wait for miracles. Up and be going!&rdquo; &mdash; <footer>John Eliot</footer></blockquote>"

FQuotesModel fQuotesModelFromJson(String str) => FQuotesModel.fromJson(json.decode(str));
String fQuotesModelToJson(FQuotesModel data) => json.encode(data.toJson());
class FQuotesModel {
  FQuotesModel({
      String? q, 
      String? a, 
      String? c, 
      String? h,}){
    _q = q;
    _a = a;
    _c = c;
    _h = h;
}

  FQuotesModel.fromJson(dynamic json) {
    _q = json['q'];
    _a = json['a'];
    _c = json['c'];
    _h = json['h'];
  }
  String? _q;
  String? _a;
  String? _c;
  String? _h;
FQuotesModel copyWith({  String? q,
  String? a,
  String? c,
  String? h,
}) => FQuotesModel(  q: q ?? _q,
  a: a ?? _a,
  c: c ?? _c,
  h: h ?? _h,
);
  String? get q => _q;
  String? get a => _a;
  String? get c => _c;
  String? get h => _h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = _q;
    map['a'] = _a;
    map['c'] = _c;
    map['h'] = _h;
    return map;
  }

}