import 'package:codequizzers/app/core/provider/api_provider.dart';
import 'package:codequizzers/app/core/provider/i_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategoriesProvider extends IProvider<Response> {
  @override
  String get endpoint => "/categories";

  Future<Response> getCategories() async {
    return await ApiProvider.instance.get(
      endpoint: "$endpoint?apiKey=${dotenv.env['API_KEY']}",
    );
  }
}
