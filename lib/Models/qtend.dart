import 'dart:convert';
/// quoteText : "Anyone who doesn't take truth seriously in small matters cannot be trusted in large ones either."
/// quoteAuthor : "Albert Einstein"
/// senderName : ""
/// senderLink : ""
/// quoteLink : "http://forismatic.com/en/f9710dd0ec/"

Qtend qtendFromJson(String str) => Qtend.fromJson(json.decode(str));
String qtendToJson(Qtend data) => json.encode(data.toJson());
class Qtend {
  Qtend({
      String? quoteText, 
      String? quoteAuthor, 
      String? senderName, 
      String? senderLink, 
      String? quoteLink,}){
    _quoteText = quoteText;
    _quoteAuthor = quoteAuthor;
    _senderName = senderName;
    _senderLink = senderLink;
    _quoteLink = quoteLink;
}

  Qtend.fromJson(dynamic json) {
    _quoteText = json['quoteText'];
    _quoteAuthor = json['quoteAuthor'];
    _senderName = json['senderName'];
    _senderLink = json['senderLink'];
    _quoteLink = json['quoteLink'];
  }
  String? _quoteText;
  String? _quoteAuthor;
  String? _senderName;
  String? _senderLink;
  String? _quoteLink;
Qtend copyWith({  String? quoteText,
  String? quoteAuthor,
  String? senderName,
  String? senderLink,
  String? quoteLink,
}) => Qtend(  quoteText: quoteText ?? _quoteText,
  quoteAuthor: quoteAuthor ?? _quoteAuthor,
  senderName: senderName ?? _senderName,
  senderLink: senderLink ?? _senderLink,
  quoteLink: quoteLink ?? _quoteLink,
);
  String? get quoteText => _quoteText;
  String? get quoteAuthor => _quoteAuthor;
  String? get senderName => _senderName;
  String? get senderLink => _senderLink;
  String? get quoteLink => _quoteLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quoteText'] = _quoteText;
    map['quoteAuthor'] = _quoteAuthor;
    map['senderName'] = _senderName;
    map['senderLink'] = _senderLink;
    map['quoteLink'] = _quoteLink;
    return map;
  }

}