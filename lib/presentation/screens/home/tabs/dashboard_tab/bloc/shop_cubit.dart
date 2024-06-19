import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/usecases/shop.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShopCubit extends Cubit<BasicState<Paging<Product>>> {
  final ShopUsecase useCase;
  ShopCubit(this.useCase) : super(const BasicState.initial());

  Future<void> fetchProducts() async {
    final result = await useCase.getProducts();

    emit(result.fold(
      (l) => BasicState.failure(l),
      (r) => BasicState.success(r),
    ));
  }
}
