import 'package:bemobile/src/employee_list/constants/colors.dart';
import "dart:math";
import 'package:bemobile/src/employee_list/screen/components/employee_expasion_tile.dart';
import 'package:flutter/material.dart';
import '../repository/employee_repository.dart';
import 'components/app_bar_widget.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final repository = EmployeeRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Funcionários',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 28),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pesquisar',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15.5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Nome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: repository.getEmployees(),
                builder: (context, AsyncSnapshot data) {
                  if (data.hasError) {
                    return const Text('Error');
                  }
                  if (data.data == null) {
                    return const Text('No data');
                  }

                  return Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: data.requireData!.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int? index) {
                          final  employee = data.requireData![index];
                          return EmployeeExpansionTile(
                            employee: employee,
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
