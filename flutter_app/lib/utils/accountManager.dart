import 'package:flutter_app/model/userInfoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kUserId = "userId";
const String kRealName = "realName";
const String kNickName = "nickName";
const String kPhoneNum = "phoneNum";
const String kBirthday = "birthday";
const String kGender = "gender";
const String kUserIntegral = "userIntegral";
const String kUserStatus = "userStatus";
const String kExistPayPassword = "existPayPassword";
const String kRegisterDate = "registerDate";

class AccountManager{
  int id;
  String userId;
  String realName;
  String nickName;
  String phoneNum;
  String birthday;
  String gender;
  int userIntegral;
  String userStatus;
  int existPayPassword;
  String registerDate;
}


