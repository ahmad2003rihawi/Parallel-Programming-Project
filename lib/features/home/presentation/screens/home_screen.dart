import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController(
    text: 'Riyadh',
  );

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchHomeData();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: 'اسم المدينة (مثال: Riyadh)',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onSubmitted: (value) =>
                        context.read<HomeCubit>().searchByCity(value),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => context.read<HomeCubit>().searchByCity(
                    _cityController.text,
                  ),
                  child: const Text('بحث'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state.errorMessage != null && state.items.isNotEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case HomeStatus.initial:
                  case HomeStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case HomeStatus.error:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.errorMessage ??
                                  'حدث خطأ أثناء تحميل البيانات',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () => context
                                  .read<HomeCubit>()
                                  .fetchHomeData(city: _cityController.text),
                              child: const Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      ),
                    );

                  case HomeStatus.empty:
                    return RefreshIndicator(
                      onRefresh: () => context.read<HomeCubit>().fetchHomeData(
                        isRefresh: true,
                      ),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 160),
                          Center(child: Text('لا توجد نتائج لهذه المدينة')),
                        ],
                      ),
                    );

                  case HomeStatus.loaded:
                    return RefreshIndicator(
                      onRefresh: () => context.read<HomeCubit>().fetchHomeData(
                        isRefresh: true,
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                        itemCount: state.items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.title),
                              subtitle: Text(item.subtitle),
                              trailing: item.price != null
                                  ? Text('${item.price} ${item.currency ?? ''}')
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
