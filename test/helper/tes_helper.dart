import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/features/news/data/datasources/remote_data_source.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([NewsModel, NewsRemoteDataSource, NetworkInfo],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
