class Category {
  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  Function _onPress;

  Function get onPress => _onPress;

  set onPress(Function onPress) {
    _onPress = onPress;
  }

  // Constructor, with syntactic sugar for assignment to members.
  Category(this._name, this._onPress) {}
}
