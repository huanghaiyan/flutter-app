class MyFansModel {
	int pageSize;
	List<MyFansItemModel> list;
	int pageNum;

	MyFansModel({this.pageSize, this.list, this.pageNum});

	MyFansModel.fromJson(Map<String, dynamic> json) {
		pageSize = json['pageSize'];
		if (json['list'] != null) {
			list = new List<MyFansItemModel>();(json['list'] as List).forEach((v) { list.add(new MyFansItemModel.fromJson(v)); });
		}
		pageNum = json['pageNum'];
	}
}

class MyFansItemModel {
	String nickName;
	String userAvatar;
	int articleCount;
	int attentionCount;
	int fansCount;
	int id;
	int attentionFlag;
	String userName;
	String userId;

	MyFansItemModel({this.nickName, this.userAvatar, this.articleCount, this.attentionCount, this.fansCount, this.id, this.attentionFlag, this.userName, this.userId});

	MyFansItemModel.fromJson(Map<String, dynamic> json) {
		nickName = json['nickName'];
		userAvatar = json['userAvatar'];
		articleCount = json['articleCount'];
		attentionCount = json['attentionCount'];
		fansCount = json['fansCount'];
		id = json['id'];
		attentionFlag = json['attentionFlag'];
		userName = json['userName'];
		userId = json['userId'];
	}
}
