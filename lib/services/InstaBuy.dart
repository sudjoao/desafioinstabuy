import 'package:http/http.dart' as http;

class InstaBuyService {
  final API = 'https://api.instabuy.com.br/apiv3/';

  Future<dynamic> getLayout() async {
    var queryParams = {'subdomain': 'bigboxdelivery'};
    var url = API + 'layout' + '?' + Uri(queryParameters: queryParams).query;
    var response = await http.get(url);
    print(response.body);
  }
}
