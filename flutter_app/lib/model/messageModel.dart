class MessageModel {
  const MessageModel({
    this.imageUrl,
    this.messageTitle,
    this.messageDesc,
    this.messageDate,
  });

  final imageUrl;
  final messageTitle;
  final messageDesc;
  final messageDate;
}

final List<MessageModel> messageList = [
  MessageModel(
    imageUrl:
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3146277763,293920617&fm=111&gp=0.jpg",
    messageTitle: "熊猫没了黑眼圈",
    messageDesc: "你好，在吗？",
    messageDate: "下午12:21",
  ),
  MessageModel(
    imageUrl:
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=364356807,675598281&fm=26&gp=0.jpg",
    messageTitle: "招商银行",
    messageDesc: "交易提醒",
    messageDate: "昨天",
  ),
  MessageModel(
    imageUrl:
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1754055693,3155135320&fm=26&gp=0.jpg",
    messageTitle: "微信消息",
    messageDesc: "[应用消息]",
    messageDate: "2019-02-23",
  ),
];
