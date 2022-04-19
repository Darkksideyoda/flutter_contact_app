class ContactGroup {
  late String _phoneId;
  late String _groupName;

  ContactGroup(this._groupName, this._phoneId);
  String get PhoneId => _phoneId;
  String get GroupName => _groupName;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["PhoneId"] = _phoneId;
    map["GroupName"] = _groupName;
    return map;
  }

  ContactGroup.fromObject(dynamic obj) {
    this._phoneId = obj['PhoneId'];
    this._groupName = obj['GroupName'];
  }
}
