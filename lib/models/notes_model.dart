class Notes {
   String? text='';
   dynamic time ;
   String? id = '';

  Notes({this.text,this.id,this.time});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['time'] = time;
    data['id'] = id;
    return data;
  }

  Notes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    time = json['time'];
    id = json['id'];
  }


}