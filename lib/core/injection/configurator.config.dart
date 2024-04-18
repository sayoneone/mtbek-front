// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/client_local_datasource.dart' as _i5;
import '../../data/datasource/remote/abstract/car_remote_datasource.dart'
    as _i16;
import '../../data/datasource/remote/abstract/client_remote_datasource.dart'
    as _i22;
import '../../data/datasource/remote/abstract/order_remote_datasource.dart'
    as _i20;
import '../../data/datasource/remote/impl/car_remote_datasource_impl.dart'
    as _i17;
import '../../data/datasource/remote/impl/client_remote_datasource_impl.dart'
    as _i23;
import '../../data/datasource/remote/impl/order_remote_datasource_impl.dart'
    as _i21;
import '../../data/repository/car_repository_impl.dart' as _i19;
import '../../data/repository/client_repository_impl.dart' as _i36;
import '../../data/repository/order_repository_impl.dart' as _i33;
import '../../data/repository/platform_repository_impl.dart' as _i7;
import '../../domain/repository/car_repository.dart' as _i18;
import '../../domain/repository/client_repository.dart' as _i35;
import '../../domain/repository/order_repostory.dart' as _i32;
import '../../domain/repository/platform_repository.dart' as _i6;
import '../../domain/usecase/auth/get_user_usecase.dart' as _i39;
import '../../domain/usecase/auth/post_login_usecase.dart' as _i38;
import '../../domain/usecase/auth/post_registration_usecase.dart' as _i37;
import '../../domain/usecase/car/get_car_brands_usecase.dart' as _i30;
import '../../domain/usecase/car/get_car_models_usecase.dart' as _i27;
import '../../domain/usecase/car/get_car_subtypes_usecase.dart' as _i29;
import '../../domain/usecase/car/get_car_types_usecase.dart' as _i26;
import '../../domain/usecase/car/get_user_cars_paginated_usecase.dart' as _i31;
import '../../domain/usecase/car/get_user_cars_usecase.dart' as _i28;
import '../../domain/usecase/client/get_regions_usecase.dart' as _i47;
import '../../domain/usecase/order/get_order_types_usecase.dart' as _i44;
import '../../domain/usecase/order/get_user_orders_usecase.dart' as _i43;
import '../../domain/usecase/order/post_create_order_usecase.dart' as _i42;
import '../../domain/usecase/platform/get_camera_image_usecase.dart' as _i24;
import '../../domain/usecase/platform/get_gallery_image_usecase.dart' as _i25;
import '../../domain/usecase/shared_preferences/if_token_exists_usecase.dart'
    as _i12;
import '../../domain/usecase/shared_preferences/remove_token_usecase.dart'
    as _i11;
import '../../domain/usecase/shared_preferences/save_token_usecase.dart'
    as _i10;
import '../../view/app/bloc/auth_bloc/auth_bloc.dart' as _i13;
import '../../view/app/bloc/user_bloc/user_bloc.dart' as _i41;
import '../../view/auth/forgot_password/bloc/forgot_password_bloc.dart' as _i3;
import '../../view/auth/login/bloc/login_bloc.dart' as _i45;
import '../../view/auth/otp/bloc/otp_bloc.dart' as _i4;
import '../../view/auth/registration/bloc/registration_bloc.dart' as _i48;
import '../../view/screens/cars/create_car/bloc/create_car_bloc.dart' as _i34;
import '../../view/screens/cars/my_cars_screen/bloc/my_cars_bloc.dart' as _i40;
import '../../view/screens/orders/create_order/bloc/create_order_bloc.dart'
    as _i49;
import '../../view/screens/orders/my_orders/bloc/my_orders_bloc.dart' as _i46;
import '../shared/cache.dart' as _i8;
import '../shared/cache_impl.dart' as _i9;
import '../shared/http.dart' as _i14;
import '../shared/http_client_impl.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ForgotPasswordBloc>(() => _i3.ForgotPasswordBloc());
    gh.singleton<_i4.OtpBloc>(() => _i4.OtpBloc());
    gh.lazySingleton<_i5.ClientLocalDataSource>(
        () => _i5.ClientLocalDataSourceImpl());
    gh.lazySingleton<_i6.PlatformRepository>(
        () => _i7.PlatformRepositoryImpl());
    gh.factory<_i8.Cache>(() => _i9.CacheImpl());
    gh.lazySingleton<_i10.SaveTokenUseCase>(
        () => _i10.SaveTokenUseCase(cache: gh<_i8.Cache>()));
    gh.lazySingleton<_i11.RemoveTokenUseCase>(
        () => _i11.RemoveTokenUseCase(cache: gh<_i8.Cache>()));
    gh.lazySingleton<_i12.IfTokenExistsUseCase>(
        () => _i12.IfTokenExistsUseCase(cache: gh<_i8.Cache>()));
    gh.singleton<_i13.AuthBloc>(() => _i13.AuthBloc(
          ifTokenExistsUseCase: gh<_i12.IfTokenExistsUseCase>(),
          saveTokenUseCase: gh<_i10.SaveTokenUseCase>(),
          removeTokenUseCase: gh<_i11.RemoveTokenUseCase>(),
        ));
    gh.factory<_i14.Http>(() => _i15.HttpImpl(cache: gh<_i8.Cache>()));
    gh.lazySingleton<_i16.CarRemoteDataSource>(
        () => _i17.CarRemoteDataSourceImpl(http: gh<_i14.Http>()));
    gh.lazySingleton<_i18.CarRepository>(() => _i19.CarRepisoryImpl(
        carRemoteDataSource: gh<_i16.CarRemoteDataSource>()));
    gh.lazySingleton<_i20.OrderRemoteDataSource>(
        () => _i21.OrderRemoteDataSourceImpl(http: gh<_i14.Http>()));
    gh.lazySingleton<_i22.ClientRemoteDataSource>(
        () => _i23.ClientRemoteDataSourceImpl(http: gh<_i14.Http>()));
    gh.lazySingleton<_i24.GetCameraImageUseCase>(() =>
        _i24.GetCameraImageUseCase(repository: gh<_i6.PlatformRepository>()));
    gh.lazySingleton<_i25.GetGalleryImageUseCase>(() =>
        _i25.GetGalleryImageUseCase(repository: gh<_i6.PlatformRepository>()));
    gh.lazySingleton<_i26.GetCarTypesUseCase>(
        () => _i26.GetCarTypesUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i27.GetCarModelsUseCase>(
        () => _i27.GetCarModelsUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i28.GetUserCarsUseCase>(
        () => _i28.GetUserCarsUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i29.GetCarSubtypesUseCase>(
        () => _i29.GetCarSubtypesUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i30.GetCarBrandsUseCase>(
        () => _i30.GetCarBrandsUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i31.GetUserCarsPaginatedUseCase>(() =>
        _i31.GetUserCarsPaginatedUseCase(repository: gh<_i18.CarRepository>()));
    gh.lazySingleton<_i32.OrderRepository>(() => _i33.OrderRepositoryImpl(
        ordersRemoteDataSource: gh<_i20.OrderRemoteDataSource>()));
    gh.singleton<_i34.CreateCarBloc>(() => _i34.CreateCarBloc(
          getCarTypesUseCase: gh<_i26.GetCarTypesUseCase>(),
          getCarSubtypesUseCase: gh<_i29.GetCarSubtypesUseCase>(),
          getCarBrandsUseCase: gh<_i30.GetCarBrandsUseCase>(),
          getCarModelsUseCase: gh<_i27.GetCarModelsUseCase>(),
        ));
    gh.lazySingleton<_i35.ClientRepository>(() => _i36.ClientRepositoryImpl(
          clientRemoteDataSource: gh<_i22.ClientRemoteDataSource>(),
          clientLocalDataSource: gh<_i5.ClientLocalDataSource>(),
          cache: gh<_i8.Cache>(),
        ));
    gh.lazySingleton<_i37.PostRegistrationUseCase>(() =>
        _i37.PostRegistrationUseCase(repository: gh<_i35.ClientRepository>()));
    gh.lazySingleton<_i38.PostLoginUseCase>(
        () => _i38.PostLoginUseCase(repository: gh<_i35.ClientRepository>()));
    gh.lazySingleton<_i39.GetUserUseCase>(
        () => _i39.GetUserUseCase(repository: gh<_i35.ClientRepository>()));
    gh.singleton<_i40.MyCarsBloc>(() =>
        _i40.MyCarsBloc(getUserCarsUseCase: gh<_i28.GetUserCarsUseCase>()));
    gh.singleton<_i41.UserBloc>(
        () => _i41.UserBloc(getUserUseCase: gh<_i39.GetUserUseCase>()));
    gh.lazySingleton<_i42.PostCreateOrderUseCase>(() =>
        _i42.PostCreateOrderUseCase(repository: gh<_i32.OrderRepository>()));
    gh.lazySingleton<_i43.GetUserOrdersUseCase>(() =>
        _i43.GetUserOrdersUseCase(repository: gh<_i32.OrderRepository>()));
    gh.lazySingleton<_i44.GetOrderTypesUseCase>(() =>
        _i44.GetOrderTypesUseCase(repository: gh<_i32.OrderRepository>()));
    gh.singleton<_i45.LoginBloc>(
        () => _i45.LoginBloc(postLoginUseCase: gh<_i38.PostLoginUseCase>()));
    gh.singleton<_i46.MyOrdersBloc>(() => _i46.MyOrdersBloc(
          getUserOrdersUseCase: gh<_i43.GetUserOrdersUseCase>(),
          getOrderTypesUseCase: gh<_i44.GetOrderTypesUseCase>(),
        ));
    gh.lazySingleton<_i47.GetRegionsUseCase>(() =>
        _i47.GetRegionsUseCase(clientRepository: gh<_i35.ClientRepository>()));
    gh.singleton<_i48.RegistrationBloc>(() => _i48.RegistrationBloc(
          postRegistrationUseCase: gh<_i37.PostRegistrationUseCase>(),
          getRegionsUseCase: gh<_i47.GetRegionsUseCase>(),
          authBloc: gh<_i13.AuthBloc>(),
        ));
    gh.singleton<_i49.CreateOrderBloc>(() => _i49.CreateOrderBloc(
          getRegionsUseCase: gh<_i47.GetRegionsUseCase>(),
          getUserCarsUseCase: gh<_i28.GetUserCarsUseCase>(),
          getOrderTypesUseCase: gh<_i44.GetOrderTypesUseCase>(),
          postCreateOrderUseCase: gh<_i42.PostCreateOrderUseCase>(),
        ));
    return this;
  }
}
