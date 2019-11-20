class UserInfoModel {
  String birthday;
  String realName;
  int userIntegral;
  String userStatus;
  String nickName;
  String phoneNum;
  int id;
  String userId;
  String gender;
  int existPayPassword;
  String registerDate;

  UserInfoModel(
      {this.birthday,
      this.realName,
      this.userIntegral,
      this.userStatus,
      this.nickName,
      this.phoneNum,
      this.id,
      this.userId,
      this.gender,
      this.existPayPassword,
      this.registerDate});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    realName = json['realName'];
    userIntegral = json['userIntegral'];
    userStatus = json['userStatus'];
    nickName = json['nickName'];
    phoneNum = json['phoneNum'];
    id = json['id'];
    userId = json['userId'];
    gender = json['gender'];
    existPayPassword = json['existPayPassword'];
    registerDate = json['registerDate'];
  }
}
