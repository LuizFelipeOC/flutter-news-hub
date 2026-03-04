import 'package:news_hub/app/core/network/network_interface.dart';
import 'package:news_hub/app/core/network/network_service.dart';
import 'package:news_hub/app/data/datasources/comments_datasource/comments_datasource.dart';
import 'package:news_hub/app/data/datasources/local/local_storage_interface.dart';
import 'package:news_hub/app/data/datasources/local/shared_preferences_storage.dart';
import 'package:news_hub/app/data/datasources/news_datasources/news_datasource.dart';
import 'package:news_hub/app/data/datasources/user_contents_datasource/user_contents_datasource.dart';
import 'package:news_hub/app/data/repository/comments/comments_repository.dart';
import 'package:news_hub/app/data/repository/news/news_repository.dart';
import 'package:news_hub/app/data/repository/users_contents/user_contents_repository.dart';
import 'package:news_hub/app/pages/home/home_page_controller.dart';
import 'package:news_hub/app/pages/new_content/new_content_controller.dart';
import 'package:news_hub/app/pages/user_contents/user_contents_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  Provider<NetworkInterface>(create: (_) => NetworkService()),
  Provider<LocalStorageInterface>(create: (_) => SharedPreferencesStorage()),
  Provider(create: (ctx) => NewsDatasource(network: ctx.read<NetworkInterface>())),
  Provider(create: (ctx) => CommentsDatasource(network: ctx.read<NetworkInterface>())),
  Provider(create: (ctx) => UserContentsDatasource(network: ctx.read<NetworkInterface>())),
  Provider(create: (ctx) => NewsRepository(newsDatasources: ctx.read<NewsDatasource>())),
  Provider(create: (ctx) => CommentsRepository(datasource: ctx.read<CommentsDatasource>())),
  Provider(create: (ctx) => UserContentsRepository(datasource: ctx.read<UserContentsDatasource>())),
  ChangeNotifierProvider<HomePageController>(
    create: (ctx) => HomePageController(newsRepository: ctx.read<NewsRepository>()),
  ),
  ChangeNotifierProvider(
    create: (ctx) => NewContentController(
      newsRepository: ctx.read<NewsRepository>(),
      commentsRepository: ctx.read<CommentsRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (ctx) => UserContentsController(repository: ctx.read<UserContentsRepository>()),
  ),
];
