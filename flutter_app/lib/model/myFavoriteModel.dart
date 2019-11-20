class MyFavoriteModel {
  const MyFavoriteModel({
    this.title,
    this.author,
    this.imageUrl,
  });
  final String title;
  final String author;
  final String imageUrl;
}

final List<MyFavoriteModel> myFavorites = [
  MyFavoriteModel(
    title: "Candy Shop",
    author: "Mohamed Chahin",
    imageUrl: "https://www.roewe.com.cn/vehicles/roewerx5/images/tab_1.jpg",
  ),
  MyFavoriteModel(
    title: "Can I help you?",
    author: "Mohamed Chahin",
    imageUrl: "https://www.roewe.com.cn/vehicles/roewerx5/images/tab_2.jpg",
  ),
  MyFavoriteModel(
    title: "Monkey",
    author: "Mohamed Chahin",
    imageUrl: "https://www.roewe.com.cn/vehicles/roewerx5/images/tab_3.jpg",
  ),
  MyFavoriteModel(
    title: "Contained",
    author: "Mohamed Chahin",
    imageUrl: "https://www.roewe.com.cn/vehicles/roewerx5/images/tab_4.jpg",
  ),
  MyFavoriteModel(
    title: "Contained",
    author: "Mohamed Chahin",
    imageUrl: "https://www.roewe.com.cn/vehicles/roewerx5/images/tab_5.png",
  ),
  MyFavoriteModel(
    title: "Contained",
    author: "Mohamed Chahin",
    imageUrl:
        "https://www.roewe.com.cn/vehicles/roewerx5/images/header-img-1.jpg",
  )
];
