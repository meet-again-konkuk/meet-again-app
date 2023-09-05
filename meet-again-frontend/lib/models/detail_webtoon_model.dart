class DetailWebToonModel{
  late final String about, genre, age;

  // WebToonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  //이건 잘 사용 하는 패턴이 아님
  //  WebToonModel(Map<String, dynamic> json){
  //    title = json['title'];
  //    thumb = json['thumb'];
  //    id = json['id'];
  //  }

  DetailWebToonModel.fromJson(Map<String, dynamic> json)
      : about = json['about'],
        genre = json['genre'],
        age = json['age'];
}