import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportGroup {
  String state;
  String title;
  String address;
  String phone;
  double lat;
  double lng;

  SupportGroup({required this.state, required this.title, required this.address, required this.phone, required this.lat, required this.lng});
}

class SupportGroupScreen extends StatelessWidget {
  final bool isDoctor;
  SupportGroupScreen({Key? key, this.isDoctor = false}) : super(key: key);

  final List<SupportGroup> supportGroups = [
    SupportGroup(
      state: "Johor",
      title: "Johor Thalassaemia Society",
      address: "Lot 5395 Jalan Kurniawati, Kampung Kurnia, 80250 Johor Bharu",
      phone: "+601-3320369",
      lat: 1.496436272569414,
      lng: 103.7658528072514,
    ),
    SupportGroup(
      state: "Kedah",
      title: "Kedah Thalassaemia Society",
      address: "5017 (1st Floor) Taman PKNK 05200 Alor Setar, Kedah",
      phone: "+601-7307140",
      lat: 6.135923144907876,
      lng: 100.38413387809152,
    ),
    SupportGroup(
      state: "Pahang",
      title: "Kuantan Thalassaemia Society",
      address: "48, 2nd Floor Jalan Gambul 25000 Kuantan, Pahang",
      phone: "+6019-9877131",
      lat: 3.8339043739665484,
      lng: 103.32793710454484,
    ),
    SupportGroup(
      state: "Penang",
      title: "Penang Thalassaemia Society",
      address: "Room CO-38 & 39 UP, Kompleks Masyarakat Penyayang, Jalan Utama, 10450 Pulau Pinang",
      phone: "+601-2288048",
      lat: 5.418926719265186,
      lng: 100.3052780480308,
    ),
    SupportGroup(
      state: "Perak",
      title: "Perak Thalassaemia Society",
      address: "No. 4 Jalan Masjid, 30300 Ipoh, Perak Malaysia",
      phone: "+601-2432470",
      lat: 4.593873862999803,
      lng: 101.08086497202713,
    ),
    SupportGroup(
      state: "Sabah",
      title: "Sabah Thalassaemia Society",
      address: "Persatuan Thalassaemia,P.O Box 22748, 88787 Luyang, Kota Kinabalu, Sabah",
      phone: "+6018-875266",
      lat: 5.946588058357688,
      lng: 116.0911754423742,
    ),
    SupportGroup(
      state: "Sarawak",
      title: "Sarawak Thalassaemia Society",
      address: "c/o Dr. Bibiana Teo's clinic, Jalan Tun Ahmad Adruce, 93150 Kuching, Sarawak",
      phone: "+6012-420008",
      lat: 1.5370323231398397,
      lng: 110.33747189634835,
    ),
    SupportGroup(
      state: "Wilayah",
      title: "Malaysian Association of Thalassaemia",
      address: "105-2 Jalan Kg Pandan, Tamar Maluri, 55100 Kuala Lumpur",
      phone: "+601-9857688",
      lat: 3.144418763202552,
      lng: 101.73055416750756,
    ),
  ];

  openMapsSheet(context, SupportGroup supportGroup) async {
    try {
      final coords = Coords(supportGroup.lat, supportGroup.lng);
      final title = supportGroup.title;
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppColors.color(context, 300);
    // debugPrint(Theme.of(context).primaryColor.toString());
    return Scaffold(
      appBar: AppBar(title: const Text("Support Groups")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: Dimensions.paddingSizeSmall),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: supportGroups.length,
                  itemBuilder: (context, index) {
                    SupportGroup supportGroup = supportGroups[index];
                    return Card(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(4),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.color(context, 700),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
                              ),
                              child:
                                  Text(supportGroup.state, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.color(context, 200),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(Icons.group, size: 40, color: AppColors.color(context, 50)),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(supportGroup.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: Dimensions.paddingSizeSmall),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              supportGroup.address,
                                              style: const TextStyle(color: Colors.black54, fontSize: Dimensions.fontSizeSmall),
                                              // maxLines: 2,
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: Dimensions.paddingSizeSmall),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(supportGroup.phone, style: const TextStyle(color: Colors.black54, fontSize: Dimensions.fontSizeSmall)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeDefault),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      launchUrl(Uri.parse("tel:${supportGroup.phone}"));
                                    },
                                    icon: Icon(Icons.phone, color: Theme.of(context).primaryColor, size: 16),
                                    label: const Text(
                                      'Call',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      openMapsSheet(context, supportGroup);
                                    },
                                    icon: Icon(Icons.directions, color: Theme.of(context).primaryColor, size: 16),
                                    label: const Text(
                                      'Navigate',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
