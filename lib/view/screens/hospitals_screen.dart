import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital {
  String title;
  String address;
  String phone;
  double lat;
  double lng;
  bool isPrivate;

  Hospital({required this.title, required this.address, required this.phone, required this.lat, required this.lng, this.isPrivate = false});
}

class HospitalsScreen extends StatelessWidget {
  final bool isDoctor;
  HospitalsScreen({Key? key, this.isDoctor = false}) : super(key: key);

  final List<Hospital> hospitals = [
    Hospital(
      title: "Gleneagles Hospital Kuala Lumpur",
      address: "282, 286 & 288 Block A, B and Medical Office Block, Jalan Ampang, 50450 Kuala Lumpur",
      phone: "+603-4141 3000",
      lat: 3.1611663220767188,
      lng: 101.73978444448984,
      isPrivate: true,
    ),
    Hospital(
      title: "Pantai Hospital Kuala Lumpur",
      address: "8, Jalan Bukit Pantai, Bangsar, 59100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-2296 0888",
      lat: 3.1200663555248225,
      lng: 101.66663791168875,
      isPrivate: true,
    ),
    Hospital(
      title: "Columbia Asia Hospital - Setapak",
      address: "No. 1, Jalan Danau Saujana, Taman Danau Kota, 53300 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-4145 9999",
      lat: 3.2015165507179733,
      lng: 101.71824794237881,
    ),
    Hospital(
      title: "Damai Service Hospital HQ",
      address: "1st Mile, 109-119, Jln Sultan Azlan Shah, 51200 Kuala Lumpur",
      phone: "+603-4043 4900",
      lat: 3.1704632823692047,
      lng: 101.6950633270338,
    ),
    Hospital(
      title: "Kuala Lumpur Hospital",
      address: "Jalan Pahang, 50586 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-2615 5555",
      lat: 3.1717610572519157,
      lng: 101.70253136936124,
    ),
    Hospital(
      title: "KPJ Tawakkal KL Specialist Hospital",
      address: "1, Jalan Pahang Barat, Pekeliling, 53000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-4026 7777",
      isPrivate: true,
      lat: 3.1772192054456028,
      lng: 101.69863166936125,
    ),
    Hospital(
      title: "Pantai Hospital Ampang",
      address: "Jalan Perubatan 1, Pandan Indah, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-4289 2828",
      lat: 3.127978079609656,
      lng: 101.75262274001116,
    ),
    Hospital(
      title: "Tung Shin Hospital",
      address: "102, Jln Pudu, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-2037 2288",
      isPrivate: true,
      lat: 3.146609608264769,
      lng: 101.70439803819527,
    ),
    Hospital(
      title: "KPJ Sentosa KL Specialist Hospital",
      address: "Damai Kompleks, 36, Jalan Chemur, Titiwangsa Sentral, 50400 Kuala Lumpur, Federal Territory of Kuala Lumpur",
      phone: "+603-4043 7166",
      isPrivate: true,
      lat: 3.171084644989536,
      lng: 101.69794763208179,
    ),
    Hospital(
      title: "Prince Court Medical Centre",
      address: "39, Jalan Kia Peng, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur",
      phone: "+603-2160 0000",
      isPrivate: true,
      lat: 3.149195362166675,
      lng: 101.72172276936138,
    ),
  ];

  openMapsSheet(context, Hospital hospital) async {
    try {
      final coords = Coords(hospital.lat, hospital.lng);
      final title = hospital.title;
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
    return Scaffold(
      appBar: AppBar(title: const Text("Hospitals")),
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
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    Hospital hospital = hospitals[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: AppColors.color(context, 200),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(Icons.local_hospital, size: 40, color: AppColors.color(context, 50)),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(hospital.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: Dimensions.paddingSizeSmall),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              hospital.address,
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
                                          Text(hospital.phone, style: const TextStyle(color: Colors.black54, fontSize: Dimensions.fontSizeSmall)),
                                          if (hospital.isPrivate)
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.color(context, 600),
                                                borderRadius: BorderRadius.circular(100),
                                              ),
                                              child: Text("Private Hospital",
                                                  style: TextStyle(
                                                      color: AppColors.color(context, 50), fontSize: Dimensions.fontSizeExtraSmall)),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      launchUrl(Uri.parse("tel:${hospital.phone}"));
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
                                      openMapsSheet(context, hospital);
                                    },
                                    icon: Icon(Icons.directions, color: Theme.of(context).primaryColor, size: 16),
                                    label: const Text(
                                      'Navigate',
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
