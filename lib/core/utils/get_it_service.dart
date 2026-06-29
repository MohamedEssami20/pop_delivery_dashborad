import 'package:get_it/get_it.dart';
import 'package:popo_delivery_dashboard/core/repos/images_repo.dart';
import 'package:popo_delivery_dashboard/core/services/data_base_service.dart';
import 'package:popo_delivery_dashboard/core/services/firestore_service.dart';
import 'package:popo_delivery_dashboard/core/services/storage_service.dart';
import 'package:popo_delivery_dashboard/core/services/supabase_storage_service.dart';
import 'package:popo_delivery_dashboard/core/services/notification_service.dart';
import 'package:popo_delivery_dashboard/core/services/fcm_notification_service.dart';
import 'package:popo_delivery_dashboard/features/add_products/domain/repos/add_product_repo.dart';
import 'package:popo_delivery_dashboard/features/auth/data/repos/auth_repo_impl.dart';
import 'package:popo_delivery_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:popo_delivery_dashboard/features/orders/domain/repos/order_repos.dart';
import '../../features/add_products/data/repos/add_product_repo_impl.dart';
import '../../features/orders/data/repos/order_repos_impl.dart';
import '../repos/admin_repo.dart';
import '../repos/admin_repo_impl.dart';
import '../repos/images_repo_impl.dart';
import '../services/cloud_flare_notification_service.dart';
import '../services/dio_service.dart';

class GetItService {
  GetIt getIt = GetIt.instance;

  void getItInit() {
    getIt.registerSingleton<DataBaseService>(FirestoreService());
    getIt.registerSingleton<StorageService>(SupabaseStorageService());
    getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(storageService: getIt.get<StorageService>()),
    );
    getIt.registerSingleton<AddProductRepo>(
      AddProductRepoImpl(
        dataBaseService: getIt.get<DataBaseService>(),
        imagesRepo: getIt.get<ImagesRepo>(),
      ),
    );

    getIt.registerSingleton<OrderRepos>(
      OrderReposImpl(dataBaseService: getIt.get<DataBaseService>()),
    );

    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

    getIt.registerSingleton<NotificationService>(FcmNotificationService());

    getIt.registerSingleton<AdminRepo>(
      AdminRepoImpl(dataBaseService: getIt.get<DataBaseService>()),
    );
    getIt.registerLazySingleton<DioService>(() => DioServiceImpl());
    getIt.registerLazySingleton<CloudflareNotificationService>(
      () => CloudflareNotificationServiceImpl(
        dioService: getIt.get<DioService>(),
      ),
    );
  }
}
