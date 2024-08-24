class GiphyModel {
  String id = "";
  String title = "";
  String username = "";
  String imageURL = "";

  GiphyModel.empty();

  GiphyModel.fromJSON(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.username = json["username"];
    this.imageURL = json["images"]["fixed_height"]["url"];
  }

  @override
  String toString() {
    return this.id + " " + this.title;
  }
}
