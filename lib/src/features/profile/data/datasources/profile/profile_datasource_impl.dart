import 'package:roome/service_locator.dart';
import 'package:roome/src/core/helpers/cache_helper.dart';
import 'package:roome/src/core/utils/app_strings.dart';
import 'package:roome/src/features/profile/data/datasources/profile/profile_datasource.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<bool> signOut() async {
    return await getIt.get<CacheHelper>().removeData(key: AppStrings.uId);
  }
}
