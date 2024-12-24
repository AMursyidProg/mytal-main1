import 'package:flutter/material.dart';
import 'package:mytal/util/dimensions.dart';

class AboutThalassaemiaScreen extends StatelessWidget {
  const AboutThalassaemiaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Thalassaemia")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Screening",
                  style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                ),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text("Thalassaemia is an inherited disease. 1 in 20 Malaysians are carriers of the gene. You could be one of them."),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text("Thalassaemia Carrier",
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text(
                    "The carrier does not show any sign of abnormalities or health problems. Diagnosis of thalassaemia can only be made via the various thalassaemia screening tests. There is every possiblility that a carrier will hand down his or her genetric traits of Thalassaemia to the children."),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text("What Is Thalassaemia",
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text(
                    "Thalassaemia is a hereditary disorder where there is insufficient hemoglobin in the red blood cells, leading to a condition known as anemia.\n\nThalassaemia can be inherited from both the parents and affect males and females alike.\n\nOne out of twenty Malaysians are a genetic carrier of Thalassaemia."),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text("Symptoms And Early Indicators Of Thalassaemia",
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text(
                    "\u2022 Child appears normal at birth. However they will slowly show signs of anemia, becoming server when they reach the age of between 3 and 18 months.\n\n\u2022 Very obvious pale and sickly appearance and the child is often weak and restless.\n\n\u2022 Severe anemia can cause breathing difficulties.\n\n\u2022 Jaundice.\n\n\u2022 Distened abdomen due to swelling of liver and heart.\n\n\u2022 Stunted growth\n\n\u2022 Changes in facial bone structures.\n\nThalassaemia patients require blood transfusion on a monthly basis. Without adequate treatment the child will experience several complications and usually die at an early age."),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text("Treatment For Thalassaemia",
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text(
                    "\u2022 Patient needs to undergo continious blood transfusion on a monthly basis.\n\n\u2022 Continious blood transfusion will cause the accumulation of iron in the vital organs such as the heart, liver, and endocrine glands. This eventually results in multiple organ malfunction.\n\n\u2022 Excessive iron can be removed by chelation therapy.\n\n\u2022 A bone marrow transplant may be necessary, provided there is a suitable donor among family members."),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text("Thalassaemia disease is preventable",
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                const Text("Preventative measures: Undergo Thalassaemia screening.\n\nAvoid marriages among Thalassaemia Carriers."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
