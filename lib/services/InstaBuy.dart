import 'package:dio/dio.dart';

class InstaBuyService {
  final api = 'https://api.instabuy.com.br/apiv3/';

  Future<dynamic> getLayout() async {
    var queryParams = {'subdomain': 'bigboxdelivery'};
    var url = api + 'layout' + '?' + Uri(queryParameters: queryParams).query;
    var response = await Dio().get(url);
    if (response.statusCode == 200)
      return response.data;
    else
      throw Exception('Status code diferente de 200');
  }
}
