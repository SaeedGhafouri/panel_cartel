import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/progress_widget.dart';
import '../../data/models/role_model.dart';
import '../../logic/cubit/role/role_cubit.dart';

class RoleDropdownWidget extends StatefulWidget {
  ///onChanged
  final Function(int) onChanged;

  const RoleDropdownWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  @override
  _RoleDropdownWidgetState createState() => _RoleDropdownWidgetState();
}

class _RoleDropdownWidgetState extends State<RoleDropdownWidget> {
  int? _selectedRoleId;
  String? _selectedRoleName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<RoleCubit>().index();
      },
      child: BlocBuilder<RoleCubit, RoleState>(
        builder: (context, state) {
          if (state is RoleLoading) {
            return Center(child: ProgressWidget());
          } else if (state is RoleLoaded) {
            List<Role> roles = state.roles;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<int>(
                  value: _selectedRoleId,
                  hint: Text(_selectedRoleName ?? "انتخاب نقش"),
                  items: roles.map((role) {
                    return DropdownMenuItem<int>(
                      value: role.id,
                      child: Text(role.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRoleId = value;
                      _selectedRoleName = roles.firstWhere((role) => role.id == value).name;
                    });
                    widget.onChanged(value!);
                  },
                ),
              ],
            );
          } else if (state is RoleError) {
            return Text("خطا در بارگذاری نقش‌ها");
          } else {
            // زمانی که لیستی وجود ندارد
            return DropdownButton<int>(
              hint: Text("انتخاب نقش"),
              items: [],
              onChanged: null,
            );
          }
        },
      ),
    );
  }
}
