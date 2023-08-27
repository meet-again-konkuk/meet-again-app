class WebToonModel {
 late final String title, thumb, id;

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

  WebToonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
