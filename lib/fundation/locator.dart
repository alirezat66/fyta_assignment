import 'package:fyta_assignment/bloc/fyta_bloc.dart';
import 'package:fyta_assignment/data/client/dio_client.dart';
import 'package:fyta_assignment/data/repository_impl/search_repository_impl.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance; // service locator

class ServiceLocator {
  static void setup() {
    // ?? singleton registrations
    //* fyta api
    locator.registerSingleton<FytaApi>(FytaApi());
    //* search implementation
    locator.registerSingleton<SearchRepositoryImpl>(
        SearchRepositoryImpl(locator<FytaApi>()));
    //* selected country repository implementation

    //?? factory registrations
    //* search  cubit
    locator.registerFactory(() => SearchCubit(locator<SearchRepositoryImpl>()));
  }
}
