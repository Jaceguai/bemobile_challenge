import 'package:bemobile/src/employee_list/constants/colors.dart';
import 'package:bemobile/src/employee_list/models/employee_model.dart';
import 'package:flutter/material.dart';
import '../../extensions/date_time_extension.dart';

class EmployeeExpansionTile extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeExpansionTile({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      collapsedIconColor: AppColors.primaryColor,
      iconColor: AppColors.primaryColor,
      collapsedTextColor: Colors.black,
      textColor: Colors.black,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(employee.image),
      ),
      title: Center(
        child: Text(
          employee.name,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      children: [
        _buildTile('Cargo', employee.job),
        const MySeparator(),
        _buildTile('Data de admissão', employee.admissionDate.getFormattedDat),
        const MySeparator(),
        _buildTile('Telefone', employee.phone),
        const MySeparator(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTile(String text, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({
    Key? key,
    this.height = 1,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
            );
          }),
        );
      },
    );
  }
}
