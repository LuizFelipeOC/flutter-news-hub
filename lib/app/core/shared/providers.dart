import 'package:news_hub/app/core/services/htttp/http_client.dart';
import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:news_hub/app/data/repository/comments/comments_repository.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/data/repository/users_contents/user_contents_repository.dart';
import 'package:news_hub/app/pages/home/home_page_controller.dart';
import 'package:news_hub/app/pages/new_content/new_content_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  Provider<IHttpClient>(create: (_) => HttpClient()),
  Provider(create: (ctx) => NewsRepository(httpClient: ctx.read<IHttpClient>())),
  Provider(create: (ctx) => CommentsRepository(httpClient: ctx.read<IHttpClient>())),
  Provider(create: (ctx) => UserContentsRepository(httpClient: ctx.read<IHttpClient>())),
  ChangeNotifierProvider<HomePageController>(
    create: (ctx) => HomePageController(newsRepository: ctx.read<NewsRepository>()),
  ),
  ChangeNotifierProvider(
    create: (ctx) => NewContentController(
      newsRepository: ctx.read<NewsRepository>(),
      commentsRepository: ctx.read<CommentsRepository>(),
    ),
  ),
];
