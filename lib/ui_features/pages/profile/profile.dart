import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/file_picker.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/pages/profile/employee_account.dart';
import 'package:magic_power_sales/ui_features/pages/profile/personal_account.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/menu_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool active = false;
  List<Map<String, dynamic>> menus = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menus = [
      {
        "title": "Info Personal",
        "icon": Assets.user,
        "onTap": () {
          nextScreen(const PersonalAccountPage());
        }
      },
      {
        "title": "Info Pegawai",
        "icon": Assets.users,
        "onTap": () {
          nextScreen(const EmployeeAccountPage());
        }
      },
      {
        "title": "Notifikasi",
        "icon": Assets.notificationOutline,
      },
      {
        "title": "Transaksi",
        "icon": Assets.listOutline,
      },
      {
        "title": "Keamanan",
        "icon": Assets.lockOutline,
      },
      {
        "title": "Pusat Bantuan",
        "icon": Assets.helpCenter,
      },
      {
        "title": "Keluar",
        "style": StyleAsset.paragraph1SemiBold.copyWith(
          color: ColorAsset.primary,
        ),
        "onTap": () async {
          LocalDB.authGuard(false);
        },
        "icon": Assets.signOut,
        "trailing": const SizedBox(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 344,
            width: screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage(
                  Assets.backgroundBanner,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                AppBar(
                  iconTheme: IconThemeData(
                    color: ColorAsset.white,
                  ),
                  shadowColor: Colors.transparent,
                  title: Text(
                    "Profile saya",
                    style: StyleAsset.heading4Bold.copyWith(
                      color: ColorAsset.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: LocalDB.user.user?.profilePic != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          formatPhotoUrl(LocalDB
                                              .user.user?.profilePic?.url),
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                shape: BoxShape.circle,
                                color: ColorAsset.accent,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () async {
                                    var pick = await FilePickerHelper.pickFile(
                                        fileType: FileType.image);
                                    if (pick.isNotEmpty) {
                                      var res =
                                          await AuthRepository.avatarUpload(
                                              pick.first);
                                      if (res.code == 200) {
                                        showInSnackBar(
                                            "Foto profil berhasil diubah");
                                        setState(() {});
                                      }
                                    }
                                  },
                                  child: Ink(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorAsset.white,
                                    ),
                                    child: Icon(
                                      Icons.edit_rounded,
                                      color: ColorAsset.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(15),
                      Text(
                        LocalDB.user.user?.fullName ?? "",
                        style: StyleAsset.heading3SemiBold.copyWith(
                          color: ColorAsset.white,
                        ),
                      ),
                      Text(
                        "Sales",
                        style: StyleAsset.paragraph1.copyWith(
                          color: ColorAsset.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(10),
          for (var row in menus)
            MenuTile(
              onTap: row["onTap"],
              divider: row["title"] != "Keluar",
              title: row["title"],
              icon: row["icon"],
              style: row["style"],
              trailing: row["title"] == "Notifikasi"
                  ? CupertinoSwitch(
                      inactiveTrackColor: ColorAsset.neutralNegative40,
                      value: active,
                      onChanged: (e) {
                        setState(() {
                          active = !active;
                        });
                      },
                    )
                  : row["trailing"],
            ),
        ],
      ),
    );
  }
}
