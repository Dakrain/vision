import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../core/base/basic_state.dart';
import '../../../core/di/injection.dart';
import '../../../domain/entities/shop/categories.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/colors.dart';
import '../../utilities/extensions.dart';
import '../../widgets/widgets.dart';
import '../home/tabs/dashboard_tab/widgets/dashboard_section.dart';
import 'bloc/new_product_cubit.dart';
import 'widgets/list_category.dart';
import 'widgets/product_item.dart';

@RoutePage()
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          injector<NewProductCubit>()..fetchProductGroupByCategory(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.26 +
                        MediaQuery.paddingOf(context).top,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Gap(MediaQuery.paddingOf(context).top + 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.maybePop();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Cửa hàng',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                // context.router.push(const CartRoute());
                              },
                              child: Assets.svg.icons.icCart.svg(),
                            ),
                          ],
                        ),
                        const Gap(24),
                        TextfieldWithLabel(
                          label: '',
                          hintText: 'Seach',
                          controller: _searchController,
                        ),
                        const Gap(24),
                        SizedBox(
                          height: 150,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  separatorBuilder: (context, index) =>
                                      const Gap(8),
                                  itemBuilder: (context, index) {
                                    return Assets.images.megaSale.image();
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const ListCategory(),
              const Gap(20),
              BlocBuilder<NewProductCubit, BasicState<Categories>>(
                builder: (context, state) {
                  return DashboardSection(
                      title: 'Sản phẩm mới',
                      shortDescription: '',
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        scrollDirection: Axis.horizontal,
                        child: state.maybeMap(
                            success: (value) {
                              if (value.data.newproducts == null) {
                                return const SizedBox();
                              }
                              return Row(
                                children: value.data.newproducts!
                                    .map((product) => ProductItem(
                                          name: product.name,
                                          url: product.imageUrl,
                                          price: product.price,
                                          style: product.style,
                                        ))
                                    .toList()
                                    .separated(const Gap(16)),
                              );
                            },
                            initial: (value) => Row(
                                  children: [
                                    const Shimmers(child: ProductItem()),
                                    const Shimmers(child: ProductItem()),
                                  ].separated(const Gap(16)),
                                ),
                            orElse: () => const SizedBox()),
                      ));
                },
              ),
              const Gap(20),
              BlocBuilder<NewProductCubit, BasicState<Categories>>(
                  builder: (context, state) {
                return state.maybeMap(
                    success: (value) {
                      if (value.data.groupbycategory == null) {
                        return const SizedBox();
                      }
                      return Column(
                        children: value.data.groupbycategory!.map((group) {
                          if (group.product == null) {
                            return const SizedBox();
                          }
                          return DashboardSection(
                            title: group.categoryName ?? '',
                            shortDescription: '',
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: group.product
                                        ?.map((product) => ProductItem(
                                              name: product.name,
                                              url: product.imageUrl,
                                              price: product.price,
                                              style: product.style,
                                            ))
                                        .toList()
                                        .separated(const Gap(8)) ??
                                    [],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                    initial: (value) => const Shimmers(
                            child: DashboardSection(
                          title: '',
                          shortDescription: '',
                          child: SizedBox(),
                        )),
                    orElse: () => const SizedBox());
              })
            ],
          ),
        ),
      ),
    );
  }
}
