import 'package:news_hub/app/core/services/htttp/http_client.dart';
import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [Provider<IHttpClient>(create: (_) => HttpClient())];
