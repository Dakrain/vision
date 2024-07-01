import '../../../../core/base/basic_state.dart';
import '../../../../domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/shop/categories.dart';

@injectable
class NewProductCubit extends Cubit<BasicState<Categories>> {
  final ShopUsecase useCase;
  NewProductCubit(this.useCase) : super(const BasicState.initial());

  Future<void> fetchProductGroupByCategory() async {
    final result = await useCase.getProductGroupByCategory();

    emit(result.fold(
      (l) => BasicState.failure(l),
      (r) => BasicState.success(r),
    ));
  }
}
