import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/providers/customer/customer_provider.dart';
import 'package:magic_power_sales/ui_features/pages/home/home_page.dart';
import 'package:magic_power_sales/ui_features/pages/merchant/customer_page.dart';
import 'package:magic_power_sales/ui_features/pages/profile/profile.dart';
import 'package:provider/provider.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  int currentPage = 0;
  bool showTab = false;
  void changeIndex(int index) {
    setState(() {
      currentPage = index;
      showTab = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Home", "Data Pelanggan"];
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            nextScreen(const ProfilePage()).then((val) {
              setState(() {});
            });
          },
          borderRadius: BorderRadius.circular(100),
          child: Ink(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              image: LocalDB.user.user?.profilePic?.url != null
                  ? DecorationImage(
                      image: NetworkImage(
                        formatPhotoUrl(LocalDB.user.user?.profilePic?.url),
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: ColorAsset.accent,
              shape: BoxShape.circle,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Divider(
            color: ColorAsset.neutral80,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset(Assets.notificationOutline),
          // ),
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => setState(() => showTab = !showTab),
          ),
          horizontalSpace(10),
        ],
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            child: () {
              if (currentPage == 0) {
                return const HomePage();
              }
              return const CustomersPage();
            }(),
          ),
          if (showTab)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ColorAsset.black.withValues(alpha: 0.5),
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: 0,
            right: 0,
            top: showTab ? 0 : -screenWidth(context),
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorAsset.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: tabs.map((tab) {
                      int i = tabs.indexOf(tab);
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => changeIndex(i),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                tab,
                                style: StyleAsset.heading3Bold.copyWith(
                                  color: currentPage == i
                                      ? ColorAsset.primary
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          if (i != tabs.length - 1) ...[
                            verticalSpace(12),
                            const Divider(thickness: 0.75, height: 0),
                            verticalSpace(12),
                          ],
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Consumer<CustomerProvider>(
            builder: (context, value, child) {
              return value.loadMore
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: ColorAsset.white.withValues(alpha: 0.75),
                        child: Center(
                          child: CircularProgressIndicator(
                              color: ColorAsset.primary),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
