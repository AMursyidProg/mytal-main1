import 'package:flutter/material.dart';
import 'package:mytal/util/dimensions.dart';

enum Language { en, bm }

class TosDialog extends StatefulWidget {
  const TosDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<TosDialog> createState() => _TosDialogState();
}

class _TosDialogState extends State<TosDialog> {
  Language language = Language.en;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SegmentedButton<Language>(
              selected: <Language>{language},
              onSelectionChanged: (Set<Language> newSelection) {
                setState(() {
                  language = newSelection.first;
                });
              },
              segments: const [ButtonSegment(value: Language.en, label: Text("EN")), ButtonSegment(value: Language.bm, label: Text("BM"))],
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            Flexible(
              child: SingleChildScrollView(
                child: language == Language.en
                    ? const Column(
                        children: [
                          // Text("INTRODUCTION TO TERMS AND CONDITION", style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                          // SizedBox(height: Dimensions.paddingSizeLarge),
                          // Text(
                          //   "MyThal is an application developed by InterNexusProtocol Sdn Bhd, as a mobile application for the medical industry targeting the Thalassaemia disease sector. Thalassaemia patients will be able to enter their own relevant treatment data with verification and input from healthcare professionals via the mobile application.\n\nThe software system will analyse all data collected and provide analytics reporting using statistical and when appropriate with Artificial intelligence algorithms. Policy makers have access to aggregated data for evidence-based decision-making while the public will be able to view general information and published data on thalassemia.\n\nIt was primarily developed to serve as a tool to augment patient data management by empowering patients as well as doctors and policy makers, providing on-demand digital data and validation.",
                          // ),
                          // SizedBox(height: Dimensions.paddingSizeLarge),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text("CHANGES TO TERMS", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "By accessing and using any part of MyThal, you acknowledge that you have read and understood the terms and conditions. We may, from time to time, update these terms and conditions.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("DEVICE", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "MyThal is an application that can be accessed using both Android and iOS platforms. To access the latest features on MyThal, Android [TBA]or iOS [TBA] (or their latest operating system versions) is required. MyThal  is   managed by InterNexusProtocol Sdn Bhd and its features may be renewed from time to time. Internet connection will also be needed to be able to use the Service.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("CONFIDENTIALITY", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Upon registering on MyThal , you will obtain a personal account that can be accessed by a One Time Password (OTP) that shall be sent to your mobile phone number or email to verify your account before the account is activated. You should not assign, transfer or give authority to any other person to use your identity nor your account. You will be required to keep your account password confidential and every identification that is given to you in your account. For children under 18 years old, their parents or guardian will be responsible for their confidentiality.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("AGREEMENT", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "By accessing this application, you will hereby agree:\n\n\u2022 To comply with all applicable local and international laws and regulations when using MyThal.\n\n\u2022 Not to submit or upload any material that is factually inaccurate, misleading, deceptive, offensive, threatening, pornographic, indecent, or otherwise objectionable to the general public in relation to your use of MyThal.\n\n\u2022 Not to access, submit or use any data that is not yours or which you are not validly authorized to access, submit or use.\n\n\u2022 To use MyThal without bringing any damage, disruption, disabling, overburden, compromising the operation of MyThal, or interfering with any person's use of MyThal.\n\n\u2022 To use MyThal in a lawful manner, consistent with these terms in the absence of fraudulent and malicious acts, for example, by hacking into or inserting malicious code, including viruses, bugs, or harmful data, into MyThal.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("COMPLIANCE", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "You agree to comply with any and all guidelines, notices, operating rules and policies, and instructions pertaining to the use of MyThal , including any amendments to the foregoing, issued by InterNexusProtocol Sdn Bhd and Ministry of Health from time to time, as well as any applicable laws and regulations (e.g., Prevention and Control of Infectious Diseases Act 1988 [Act 342].)\n\nProviding false information is an offense under Section 22 of the Prevention and Control of Infectious Diseases Act 1988 [Act 342] and Section 233 of the Communication and Multimedia Act 1998 [Act 588.]",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("LIABILITY", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "We do not accept any liability to you if we fail, or are interrupted or delayed in the performance of any obligation because of:\n\n\u2022 the non-availability or failure of any telecommunications or computer services, systems, equipment or software operated or provided by any third party; any other event not reasonably within our control.\n\nInterNexusProtocol Sdn Bhd reserves the right to amend, delete, and update the modules in MyThal , and its component. Users are advised to update the MyThal  application from time to time via checking the official media for any announcement of MyThal 's latest updates.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("INDEMNITY", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "InterNexusProtocol Sdn Bhd is entitled, without prior notification, to cancel all claims, losses, liabilities, costs and expenses if there is any indication of fraud or violation committed against the prevailing laws of the operating country/[Country]. InterNexusProtocol Sdn Bhd will not be liable or provide any compensation in any form for any financial losses, damage or legal disputes on the usage of the App if arises between any party who uses the features, modules and functions of the app.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("INTELLECTUAL PROPERTY", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "InterNexusProtocol Sdn Bhd owns or has the right to use all intellectual property rights in the contents of MyThal  or used for the provision of the application. This includes rights in copyrights, patents, database rights, trademarks and other intellectual property rights.\n\nProperty rights do not apply to the following categories of this application, and therefore these must not be used without our or the relevant owner’s prior consent:\n\n\u2022 any other intellectual property rights, including but not limited to patents, design rights and trademarks;\n\n\u2022 any logos, visuals, image rights, trademarks, trade names and design styles (except where these are integral to a document or data set) of the MyThal website, or any predecessor or linked body, as well as of any partner or contributor;\n\n\u2022 personal data (which will include but not be limited to images, videos and audio with identifiable people in them);",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("VIOLATIONS", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Any attempt to gain unauthorised access or any attempt to initiate denial of service to MyThal , including to our services and the computing infrastructure hosting the application will be subjected to criminal investigations by the enforcement authorities. We shall report any attacks or attempts to gain unauthorised access to the site or service to the relevant law enforcement authorities and shall share information about you with them.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("GOVERNING LAW", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "These terms shall be governed in accordance with the prevailing laws of the operating country.",
                          ),
                        ],
                      )
                    : const Column(
                        children: [
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text("PERUBAHAN JANGKA", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Dengan mengakses dan menggunakan mana-mana bahagian MyThal, anda mengakui bahawa anda telah membaca dan memahami terma dan syarat. Kami mungkin, dari semasa ke semasa, mengemas kini terma dan syarat ini.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("PERANTI", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "MyThal ialah aplikasi yang boleh diakses menggunakan kedua-dua platform Android dan iOS. Untuk mengakses ciri terkini pada MyThal, Android 4.4 atau iOS 12 (atau versi terkini sistem pengendalian mereka) diperlukan. MyThal diuruskan oleh INP dan ciri-cirinya mungkin dikemas kini dari semasa ke semasa. Sambungan Internet juga diperlukan untuk dapat menggunakan Perkhidmatan MyThal.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("KERAHSIAAN", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Selepas mendaftar di MyThal, anda akan memperoleh akaun peribadi yang boleh diakses oleh One Time Password (OTP) yang akan dihantar ke nombor telefon bimbit atau e-mel anda untuk mengesahkan akaun anda sebelum akaun tersebut diaktifkan. Anda tidak seharusnya menyerahkan, memindahkan atau memberi kuasa kepada orang lain untuk menggunakan identiti atau akaun anda. Anda akan diminta untuk merahsiakan kata laluan akaun anda dan sebarang pengenalan yang diberikan kepada anda dalam akaun anda.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("PERJANJIAN", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Dengan mengakses aplikasi ini, anda dengan ini bersetuju untuk:\n\n\u2022 Untuk mematuhi semua undang-undang dan peraturan tempatan dan antarabangsa yang terpakai apabila menggunakan MyThal.\n\n\u2022 Jangan serahkan atau muat naik sebarang bahan yang secara faktanya tidak tepat, mengelirukan, memperdaya, menyinggung perasaan, mengancam, lucah, tidak senonoh atau sebaliknya menyinggung perasaan orang ramai berkaitan dengan penggunaan MyThal oleh anda.\n\n\u2022 Tidak untuk mengakses, menghantar atau menggunakan mana-mana data yang bukan milik anda atau yang anda tidak dibenarkan secara sah untuk mengakses, menghantar atau menggunakan.\n\n\u2022 Untuk menggunakan MyThal tanpa menyebabkan sebarang kerosakan, gangguan, melumpuhkan, terlebih beban, menjejaskan operasi MyThal, atau mengganggu penggunaan MyThal oleh mana-mana orang.\n\n\u2022 Untuk menggunakan MyThal dengan cara yang sah, menurut syarat ini sekiranya tiada tindakan penipuan dan berniat jahat, contohnya, dengan menggodam atau memasukkan kod hasad, termasuk virus, pepijat atau data hasad, ke dalam MyThal.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("PEMATUHAN", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Anda bersetuju untuk mematuhi mana-mana dan semua garis panduan, notis, peraturan dan polisi operasi, dan arahan yang berkaitan dengan penggunaan MyThal, termasuk sebarang pindaan kepada perkara di atas, yang dikeluarkan oleh INP Sdn BhD dan KKM dari semasa ke semasa, serta mana-mana undang-undang yang terpakai.\n\nMemberi maklumat palsu adalah satu kesalahan di bawah Seksyen 22 Akta Pencegahan dan Pengawalan Penyakit Berjangkit 1988 [Akta 342] dan Seksyen 233 Akta Komunikasi dan Multimedia 1998 [Akta 588.]",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("LIABILITI", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Kami tidak menerima sebarang liabiliti kepada anda jika kami gagal, atau terganggu atau lewat melaksanakan sebarang kewajipan disebabkan oleh:\n\n\u2022 ketiadaan atau kegagalan mana-mana perkhidmatan telekomunikasi atau komputer, sistem, peralatan atau perisian yang dikendalikan atau disediakan oleh mana-mana pihak ketiga\n\n\u2022 sebarang peristiwa lain yang tidak semunasabahnya dalam kawalan kami.\n\nInterNexusProtocol Sdn Bhd dan KKM berhak meminda, memadam dan mengemas kini modul dalam MyThal, serta komponennya. Pengguna dinasihatkan untuk mengemaskini aplikasi MyThal dari semasa ke semasa melalui semakan media rasmi untuk sebarang pengumuman kemas kini MyThal terkini.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("HARTA INTELEK", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Inter Nexus Protocol dan Kementerian Kesihatan Malaysia memiliki atau berhak untuk menggunakan semua hak harta intelek dalam kandungan MyThal atau digunakan untuk penyediaan permohonan. Ini termasuk hak dalam hak cipta, paten, hak pangkalan data, tanda dagangan dan hak harta intelek yang lain.\n\nTerma tidak terpakai pada kategori berikut bagi aplikasi ini, dan oleh itu terma ini tidak boleh digunakan tanpa kebenaran kami atau pemilik yang berkaitan:\n\n\u2022 sebarang hak harta intelek lain, termasuk tetapi tidak terhad kepada paten, hak reka bentuk dan tanda dagangan\n\n\u2022 sebarang logo, visual, hak imej, tanda dagangan, nama dagangan dan gaya reka bentuk (melainkan jika ini adalah bahan kepada dokumen atau set data) tapak web MyThal, atau mana-mana badan terdahulu atau yang dipautkan, serta mana-mana rakan kongsi atau penyumbang\n\n\u2022 data peribadi (yang akan termasuk tetapi tidak terhad kepada imej, video dan audio dengan orang yang boleh dikenal pasti di dalamnya)",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("PELANGGARAN", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Sebarang percubaan untuk mendapatkan akses tanpa kebenaran atau sebarang percubaan untuk memulakan penafian perkhidmatan kepada MyThal, termasuk perkhidmatan kami dan infrastruktur pengkomputeran yang menjadi hos aplikasi akan tertakluk kepada siasatan jenayah oleh pihak penguatkuasa. Kami akan melaporkan sebarang serangan atau percubaan untuk mendapatkan akses tanpa kebenaran ke tapak atau perkhidmatan kepada pihak berkuasa penguatkuasaan undang-undang yang berkaitan dan akan berkongsi maklumat tentang anda dengan mereka.",
                          ),
                          SizedBox(height: Dimensions.paddingSizeExtraLarge),
                          Text("UNDANG-UNDANG YANG MENGAWAL", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: Dimensions.paddingSizeDefault),
                          Text(
                            "Terma-terma ini hendaklah dikawal oleh undang-undang Malaysia yang lazim",
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
