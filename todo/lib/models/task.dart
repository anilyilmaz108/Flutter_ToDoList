class Task{
  final String title;
  bool isDone;
  Task({this.title,this.isDone=false});


  void toogleStatus(){
    isDone=!isDone;
  }

  Task.fromMap(Map<String,dynamic> map):title=map["title"],isDone=map["isDone"];

  Map <String,dynamic> toMap() => {"title":title, "isDone":isDone};
}