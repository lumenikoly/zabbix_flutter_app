class User {
  String _zabbixURL;
  String _userName;
  String _password;

  String getUrl() {
    return this._zabbixURL;
  }

  String getName() {
    return this._userName;
  }

  String getPass() {
    return this._password;
  }

  void setUser(String user) {
    this._userName = user;
  }

  void setUrl(String url) {
    this._zabbixURL = url;
  }

  void setPass(String pass) {
    this._password = pass;
  }
}
