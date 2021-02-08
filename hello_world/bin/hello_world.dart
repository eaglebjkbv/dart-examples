import 'package:http/http.dart';
import 'post.dart';
import 'dart:convert';

Future getPost2() {
  var data = <Posts>[];
  var response =
      get('https://jsonplaceholder.typicode.com/posts').then((posts) {
    if (posts.statusCode == 200) {
      return json.decode(posts.body);
    } else {
      throw ('Web Sitesine ulaşılamadı');
    }
  }).then((pt) {
    print('Burası Çalıştı');

    for (var p in pt) {
      var post = Posts.fromJson(p); // Aşağıdaki ile aynı
      // var post = Posts(userId: p['userId'], id: p['id'], title: p['title'], body: p['body']);
      data.add(post);
    }
    return data;
  });
  return response;
}

void main(List<String> arguments) {
  getPost2().then((posts) {
    posts.forEach((post) => print('User Id: ' +
        post.userId.toString() +
        '\nId :' +
        post.id.toString() +
        '\nTitle :' +
        post.title +
        '\n'));
  }).catchError((err) => print('Hata :' + err));
}
