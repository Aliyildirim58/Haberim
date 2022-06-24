class User{
  final String id;
  final String name;
  final String surname;
  final String email;
  final int post_count;
  final int total_view;

User(this.id,this.name,this.surname,this.email,this.post_count,this.total_view);

factory User.fromJson(Map<String,dynamic> json){
  String id=json['_id'];
  String name=json['name'];
  String surname=json['surname'];
  String email=json['email'];
  int post_count=json['post_count'];
  int total_view=json['total_view'];
  return User(id, name, surname, email, post_count, total_view);
}

}