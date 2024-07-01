// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/chat_tab/tabs/contacts_tab/cubit/contact_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, BasicState<Paging<Contact>>>(
      builder: (context, state) {
        return state.maybeMap(
          success: (state) {
            return ListView.separated(
              itemCount: state.data.rows.length,
              separatorBuilder: (_, __) => const Divider(
                thickness: 1,
                height: 1,
                color: kGreyscale5,
              ),
              itemBuilder: (context, index) {
                final contact = state.data.rows[index];
                return ContactItem(
                  imageUrl: contact.user.avatarUrl ?? '',
                  name: contact.user.fullName ?? '',
                  email: contact.user.email ?? '',
                );
              },
            );
          },
          loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
  });
  final String imageUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Avatar(
            url: imageUrl,
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
              )
            ],
          )
        ],
      ),
    );
  }
}
