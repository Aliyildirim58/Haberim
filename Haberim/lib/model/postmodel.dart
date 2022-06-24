class Post{
  final String id;
  final String title;
  final String detail;
  final String city;
  final String category;
  final String img;
  final int like_count;
  final int dislike_count;
  final int complain_count;
  final String useremail;
  Post(this.id,this.title,this.detail,this.city,this.category,this.img,this.like_count,this.dislike_count,this.complain_count,this.useremail);
  factory Post.fromJson(Map<String,dynamic> json){
    String id=json['_id'];
    String title=json['post_title'];
    String detail=json['post_detail'];
    String city=json['post_city'];
    String category=json['post_category'];
    String img=json['post_img'];
    int like_count=json['post_likecount'];
    int dislike_count=json['post_dislikecount'];
    int complain_count=json['post_complain'];
    String useremail=json['post_useremail'];

    return Post(id, title, detail, city, category, img, like_count, dislike_count, complain_count, useremail);

  }


}