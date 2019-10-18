class DogModel{
  String breedName;
  List<String> img;
  DogModel(this.breedName,this.img);

  static List<String>getName(Map<String,dynamic> json){
    List<String> nameBreeds = new List();
    var data= json['message'] as List;
    for(var item in data){
      nameBreeds.add(item);
    }
    return nameBreeds;
  }


  static List<String>getImage(Map<String,dynamic> json){
    List<String> imageBreeds = new List();
    var data= json['message'] as List;
    for(var item in data){
      imageBreeds.add(item);
    }
    return imageBreeds;
  }
}