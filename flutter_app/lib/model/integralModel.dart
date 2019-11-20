class IntegralModel{
  String integral;
  String inviteCode;
  IntegralModel(
      this.integral,
      this.inviteCode
      );
  IntegralModel.fromJson(Map<String, dynamic>json){
    integral = json["integral"];
    inviteCode = json["inviteCode"];
  }
}