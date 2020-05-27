class CategoryModel {
  String code;
  String message;
  List<Data> data;

  CategoryModel({
    this.data, this.code, this.message
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
    if (json["data"] != null) {
      data = new List<Data>();
      json["data"].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["message"] = this.message;
    if (this.data != null) {
      data["data"] = this.data.map((e) {
        e.toJson();
      }).toList();
    }
    return data;
  }
}


class Data {
  int firstCategoryId;
  String firstCategoryName;
  String comments;
  String image;
  List<SecondCategoryVO> secondCategoryVO;

  Data({this.comments, this.firstCategoryId,
    this.firstCategoryName, this.image, this.secondCategoryVO});

  Data.fromJson(Map<String, dynamic> json) {
    firstCategoryName = json["firstCategoryName"];
    image = json["image"];
    firstCategoryId = json["firstCategoryId"];
    comments = json["comments"];
    if (json["secondCategoryVO"] != null) {
      secondCategoryVO = new List<SecondCategoryVO>();
      json["secondCategoryVO"].forEach((v) {
        secondCategoryVO.add(new SecondCategoryVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["firstCategoryId"] = this.firstCategoryId;
    data["firstCategoryName"] = this.firstCategoryName;
    data["comments"] = this.comments;
    data["image"] = this.image;
    if (this.secondCategoryVO != null) {
      data["secondCategoryVO"] = this.secondCategoryVO.map((e) {
        e.toJson();
      }).toList();
    }
    return data;
  }
}

class SecondCategoryVO{
  int firstCategoryId;
  int secondCategoryId;
  String secondCategoryName;
  String comments;

  SecondCategoryVO({this.comments, this.firstCategoryId,
    this.secondCategoryId, this.secondCategoryName});

  SecondCategoryVO.fromJson(Map<String, dynamic> json) {
    secondCategoryId = int.parse(json["secondCategoryId"]);
    secondCategoryName = json["secondCategoryName"];
    firstCategoryId = json["firstCategoryId"];
    comments = json["comments"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["firstCategoryId"] = this.firstCategoryId;
    data["secondCategoryName"] = this.secondCategoryName;
    data["secondCategoryId"] = this.secondCategoryId;
    data["comments"] = this.comments;
    return data;
  }
}