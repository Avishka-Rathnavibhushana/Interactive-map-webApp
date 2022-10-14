import 'package:flutter/material.dart';

class AppColors {
  //colors
  static const Color white = Colors.white;

//Primary Palette
  static const Color night = Color(0xFF263349);
  static const Color sea = Color(0xFF003C71);
  static const Color seaLight = Color.fromARGB(255, 56, 167, 231);

//Gradients
  static const LinearGradient seaToSky = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      sea,
      sky,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );
  static const LinearGradient fogToWhite = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      fog,
      white,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );

//Secondary Palette
  static const Color fern = Color(0xFFCDDF4A);
  static const Color sky = Color(0xFF006AA6);

//Neutral Palette
  static const Color ash = Color(0xFF4D4D4D);
  static const Color smoke = Color(0xFFCCCCCC);
  static const Color fog = Color(0xFFEFEFEF);
}

//assets links
const homeImage = 'assets/graphics/HOME.png';
const moreImage = 'assets/graphics/MORE.png';
const nextImage = 'assets/graphics/Next.png';
const buildingsTransitionImage = 'assets/graphics/Buildings.png';
const vehiclesTransitionImage = 'assets/graphics/Vehicles.png';
const dataAnimationGif = 'assets/animations/Data_animation_512.gif';
const dataCenterAirFlowGif = 'assets/animations/Data_Center_airflow.gif';

const BASE_URL =
    'https://storage.cloud.google.com/pm-im-co-uk.appspot.com/assets/2022-09-23/';

//video links
//home screen
const Intro_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_Loop.mp4?alt=media&token=de146609-1578-4222-9d03-faed32cea9b4";
const Intro_to_Buildings =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_to_Buildings.mp4?alt=media&token=8a047807-c526-45e0-a294-3a85e1d4be26";
const Intro_to_Vehicles =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_to_Vehicles.mp4?alt=media&token=cf34c004-9f48-4e16-8090-0df01e6ffa3f";

//building home screen
const Buildings_Main =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2FBuildings_Main.mp4?alt=media&token=9a092883-38a8-4934-961a-7535bf59e484";
const bank_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fbank.mp4?alt=media&token=621c5254-06a3-4417-a6bd-a190533edb2b";
const datacentre_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fdatacentre.mp4?alt=media&token=8f8b9681-66ae-4014-82ba-4d0c769fb41a";
const school_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fschool.mp4?alt=media&token=3030484b-81de-4e9a-a7b3-db255da2373d";
const retail_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fretail.mp4?alt=media&token=45fae3d4-9921-4f63-b092-5f6472bcd132";
const warehouse_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fwarehouse.mp4?alt=media&token=f66dcb93-17fc-4e38-934a-9d1f89bdc81e";
const groceryshop_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fgroceryshop.mp4?alt=media&token=0a9ff35a-cff4-459e-b760-1afaeea7258a";
const fastfood_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Ffastfood.mp4?alt=media&token=970b8755-509f-4a34-8951-1a6b2bd024b4";
const barn_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fbarn.mp4?alt=media&token=9f83c68e-95f1-4722-bd33-9d5d46cce983";
const Buildings_To_Vehicles =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2FBuildings_To_Vehicles.mp4?alt=media&token=35671a38-c03d-4ce0-8ac0-19c71f1d423c";

//building home screen
const Vehicles_Main_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVehicles_Main_Loop.mp4?alt=media&token=9b9b0149-ca17-464b-86e9-77e3e02078a7";
const Veh_To_Train =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Train.mp4?alt=media&token=86da575f-b328-496a-9c51-842c806406b8";
const Veh_To_Car =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Car.mp4?alt=media&token=70ea51af-c880-4764-ba00-4a2014f37cdd";
const Veh_To_AGV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_AGV.mp4?alt=media&token=8716ce5f-50b8-48df-b095-8bf0df9f0194";
const Veh_To_Bus =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Bus.mp4?alt=media&token=ad2991c0-7ab5-4aaf-8d49-86e34eb35837";
const Veh_To_Tractor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Tractor.mp4?alt=media&token=fdbc8735-bdc7-4ee2-9f46-6f6482c35dfd";
const Veh_To_Exc =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Exc.mp4?alt=media&token=7a672edd-2555-4168-9741-78c6804c9f6e";
const Veh_To_Truck =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Truck.mp4?alt=media&token=c6af75df-1b57-488e-8471-a8d9f9ebdf59";
const Vehicles_To_Buildings =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVehicles_To_Buildings.mp4?alt=media&token=1c7b1276-b39f-4b10-b5ad-7b64f5221bbb";

//bank screen
const bank_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_REV.mp4?alt=media&token=b0ece572-68f5-4ea5-80a3-ec42c0fb622c";
const bank_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_MOTOR.mp4?alt=media&token=94d2111c-ac91-4229-80b7-899a0891c19e";
const bank_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_MAP.mp4?alt=media&token=5cfb6c12-7239-42d2-8d05-4617203c33d8";

//dairy barns screen
const barn_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_REV.mp4?alt=media&token=202218f4-a202-4f65-a758-e64517ba0b02";
const barn_to_TXMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_to_TXMotor.mp4?alt=media&token=bd75d294-7677-43eb-83df-5b0a023e6b17";
const barn_To_Tractor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_To_Tractor.mp4?alt=media&token=4de0f6fc-2a69-47f1-80da-31a3bcd66bb0";
const barn_ipad =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_ipad.mp4?alt=media&token=7c2de2aa-2cd5-46c0-9358-eb93971f5da8";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

// //bank screen
// const bank_REV = "";

//avg nrm screen
const Veh_To_AGV_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_AGV_REV.mp4?alt=media&token=538c0c05-9fb6-47e3-8ad9-cc1b477da1fc";
const AGV_To_Battery =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FAGV_To_Battery.mp4?alt=media&token=b6bfac4d-c398-4b8f-97bd-3bc2b9b71c99";

//bus screen
const Veh_To_Bus_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Bus_REV.mp4?alt=media&token=99d42a4b-f2f9-4021-8937-c2a5648382a7";
const Bus_To_Fan =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_Fan.mp4?alt=media&token=903def28-d4bd-40e8-b948-1e88f1532373";
const Bus_To_Inverter =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_Inverter.mp4?alt=media&token=50c69c68-6d58-4ac7-a9d7-ca2ed4f5a881";
const Bus_To_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_HDMotor.mp4?alt=media&token=9e367ef7-2049-4334-8747-3aaa5d27826b";

//pages
class Pages {
  static const home = 'home';

  static const buildings = 'buildings';
  static const motor = 'motor';
  static const motorToHome = 'motorToHome';
  static const map = 'map';
  static const ipad = 'ipad';

  static const school = 'Schools';
  static const bank = 'bank';
  static const grocery = 'grocery';
  static const dataCenter = 'dataCenter';
  static const fastfoods = 'fastfoods';
  static const werehouse = 'werehouse';
  static const retail = 'retail';
  static const dairyBarns = 'dairyBarns';

  static const vehicle = 'vehicle';
  static const transition = 'transition';
  static const transitionPageToHome = 'transitionPageToHome';
  // static const map = 'map';

  static const avgNarm = 'avgNarm';
  static const train = 'train';
  static const excavator = 'excavator';
  static const sportsCar = 'sportsCar';
  static const truck = 'truck';
  static const tractor = 'tractor';
  static const bus = 'bus';
}

//fonts
class Fonts {
  static const black = "Barlow-Black";
  static const blackItalic = "Barlow-BlackItalic";
  static const bold = "Barlow-Bold";
  static const boldItalic = "Barlow-BoldItalic";
  static const extraBold = "Barlow-ExtraBold";
  static const extraBoldItalic = "Barlow-ExtraBoldItalic";
  static const extraLight = "Barlow-ExtraLight";
  static const extraLightItalic = "Barlow-ExtraLightItalic";
  static const iitalic = "Barlow-Italic";
  static const light = "Barlow-Light";
  static const lightItalic = "Barlow-LightItalic";
  static const medium = "Barlow-Medium";
  static const mediumItalic = "Barlow-MediumItalic";
  static const regular = "Barlow-Regular";
  static const semiBold = "Barlow-SemiBold";
  static const semiBoldItalic = "Barlow-SemiBoldItalic";
  static const thin = "Barlow-Thin";
  static const thinItalic = "Barlow-ThinItalic";
}

//VideoAspect Ratio
class VideoAspectRatio {
  static const width = 1920.0;
  static const height = 1080.0;
}

//VideoAspect Ratio
class ScreenSizes {
  static const Size Mobile = Size(500, 300);
}

// Application texts
class TextsConstants {
  // static const Map<String, dynamic> schoolTexts = {
  //   "topic": "Schools",
  //   "TextAreaSmallWithClip": [
  //     "64%",
  //     "of energy in schools is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Schools",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       // ["TOPIC", "Energy savings", ":"],
  //       ["DECORATEDTEXT", "Energy Savings:", " 87% baseline motor"],
  //       ["DECORATEDTEXT", "Energy Savings:", " 34% VFD retrofits"],
  //       ["DECORATEDTEXT", "Time to payback:", " 3.1 years"],
  //     ],
  //     "topic": "Leading National University",
  //     "description": "School Gymnasium",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> fastFoodTexts = {
  //   "topic": "Quick Serve Restaurants",
  //   "TextAreaSmallWithClip": [
  //     "28%",
  //     "HVAC represents 28% of a restaurant's energy costs on average",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Restaurants",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Energy reduction:", " 70% annually"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$2.3K per location"],
  //       ["DECORATEDTEXT", "Energy saved:", " 19,174 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.6 years"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/09/TT-Case-Study-Five-Guys_v04TL.pdf"
  //       ],
  //     ],
  //     "topic": "Five Guys",
  //     "description": "Quick Serve Restaurant",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> bankTexts = {
  //   "topic": "Banks",
  //   "TextAreaSmallWithClip": [
  //     "40-60%",
  //     "of energy in bank branches is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Banks",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Locations:", " 300+"],
  //       ["DECORATEDTEXT", "Energy reduction:", " 15%"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$500k"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/10/Case-Study-Fifth-Third-Bank_v07.pdf"
  //       ],
  //     ],
  //     "topic": "Fifth Third Bank",
  //     "description": "Retail branch locations",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> retailTexts = {
  //   "topic": "Retail Stores",
  //   "TextAreaSmallWithClip": [
  //     "70%",
  //     "of energy in retail is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Retail Stores",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Locations:", " 400+"],
  //       ["DECORATEDTEXT", "Energy reduction:", " 60% annually"],
  //       // ["DECORATEDTEXT", "Annual savings:", " \$K per location"],
  //       // ["DECORATEDTEXT", "Energy saved:", " KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 3 years"],
  //       // [
  //       //   "HYPERLINK",
  //       //   "Case Study Link",
  //       //   "https://turntide.com/wp-content/uploads/2022/08/Case-Study-Ivanhoe-Cambridge_v04.pdf"
  //       // ],
  //     ],
  //     "topic": "Wilko",
  //     "description": "Retail Stores",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> warehouseTexts = {
  //   "topic": "Warehouses",
  //   "TextAreaSmallWithClip": [
  //     "75%",
  //     "of energy in warehouses and distribution centers is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Warehouses",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Motor energy savings:", " 78%"],
  //       ["DECORATEDTEXT", "Energy saved annually:", " 224,162 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.4 years"],
  //     ],
  //     "topic": "Ecommerce Warehouse",
  //     "description": "Major Distribution and Fulfillment Center",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> dataCentreTexts = {
  //   "topic": "Data Centers",
  //   "TextAreaSmallWithClip": [
  //     "37%",
  //     "of energy in data centers is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Data Centers",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Fan energy savings:", " 25%"],
  //       ["DECORATEDTEXT", "Energy savings:", " 1 Million+ KWH"],
  //       ["DECORATEDTEXT", "Energy rebate: ", " Qualified for \$200K"],
  //     ],
  //     "topic": "Large Data Center",
  //     "description": "Air-cooled hot/cold aisle design",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> groceryShopTexts = {
  //   "topic": "Grocery Stores",
  //   "TextAreaSmallWithClip": [
  //     "50%",
  //     "of energy in grocery stores is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Grocery Stores",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Energy reduction:", " 75% annually"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$18.4K per location"],
  //       ["DECORATEDTEXT", "Energy saved:", " 153,649 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.37 years"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/09/TT-Case-Study-Sprouts_v04TL.pdf"
  //       ],
  //     ],
  //     "topic": "Sprouts",
  //     "description": "Grocery Store",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> dairyBarnsTexts = {
  //   "topic": "Dairy Barns",
  //   // "TextAreaSmallWithClip": [
  //   //   "X%",
  //   //   "Barn statistics",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide Intelligent Barn",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [],
  //     "topic": "",
  //     "description": "",
  //   },
  //   "subTopics": [
  //     "TX Motor",
  //     "DairyBOS®",
  //     "Tractors",
  //   ],
  // };

  // static const Map<String, dynamic> sportsCarTexts = {
  //   "topic": "Sports Cars",
  //   // "TextAreaSmallWithClip": [
  //   //   "64%",
  //   //   "of energy in sports Car is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for EVs",
  //     "description":
  //         "High performance motors and inverters featuring class leading power density (35kW/l for inverters, 6kW/kg for motors) and high levels of functional safety.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //     "Prevent learning disruption",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> tractorTexts = {
  //   "topic": "Tractors",
  //   // "TextAreaSmallWithClip": [
  //   //   "28%",
  //   //   "of tractor energy costs are from HVAC on avarage",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Tractors",
  //     "description":
  //         "We'll deliver the intelligence, efficiency, and controls you need to build industry-leading vehicles, from tractors to combines, for years to come.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> avgNarmTexts = {
  //   "topic": "Material Handling",
  //   // "TextAreaSmallWithClip": [
  //   //   "40-60%",
  //   //   "of energy in AGV / AMR branches is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Material Handling",
  //     "description":
  //         "/We offer Lithium-ion batteries to increase the productivity of your warehouse or distribution center material handling equipment by minimizing downtime and taking advantage of opportunity charging.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Battery Packs",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Performance Lithium-ion NMB battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "Series system voltage"},
  //         {"topic": "4.97-700kWh", "description": "Capacity"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> truckTexts = {
  //   "topic": "Trucks",
  //   // "TextAreaSmallWithClip": [
  //   //   "70%",
  //   //   "of energy in Truck is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Trucks",
  //     "description":
  //         "From last-mile delivery to Class8 40T trucks, we offer a range of highly reliable electrification solutions from high power electrified traction motors and drives to low power pumps, fans, and hotel loads to help you deliver your emissions targets.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> busTexts = {
  //   "topic": "Buses",
  //   // "TextAreaSmallWithClip": [
  //   //   "75%",
  //   //   "of energy in Buses is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Buses",
  //     "description":
  //         "We offer powertrain systems to satisfy on-road functional safety to ISO26262 ASIL-D with all the power and torque you need.\n\nSelect from a range of low voltage and high voltage pump and fan cooling solutions.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> excavatorTexts = {
  //   "topic": "Excavators",
  //   // "TextAreaSmallWithClip": [
  //   //   "37%",
  //   //   "of energy in Excavators is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       [
  //         "HYPERLINK",
  //         "Case study",
  //         "https://turntide.com/wp-content/uploads/2022/08/Case-Study-Mini-Excavator_v07JCB-1.pdf"
  //       ],
  //     ],
  //     "topic": "Turntide for Construction",
  //     "description":
  //         "Designing and manufacturing construction equipment?  We'll help you electrify your excavators or backhoes and get you to market quickly and easily with a fully scalable electrified powertrain solution.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Motors",
  //     "Battery Packs",
  //     "Inverters",
  //     "DC/DC Convertors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //     {
  //       "topic": "High Performance Lithium-ion NMB battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "Series system voltage"},
  //         {"topic": "4.97-700kWh", "description": "Capacity"}
  //       ],
  //     },
  //     {
  //       "topic": "Low Voltage Inverters",
  //       "subTopic": "Powering mainstream EV's for over 10 years",
  //       "descriptioTexts": [
  //         ["TEXT", "Supports a wide range of motor types"],
  //         ["TEXT", "Highly configurable operation & communications"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf",
  //           "assets/tempory images/QR/LVDrive_temp.png"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "900A", "description": "PEAK CURRENT"},
  //         {"topic": "48-110V", "description": "OPERATING VOLTAGE"}
  //       ],
  //     },
  //     {
  //       "topic": "DC/DC Convertors",
  //       "subTopic":
  //           "Product range for low voltage electrification applications",
  //       "descriptioTexts": [
  //         ["TEXT", "Low voltage and high voltage options"],
  //         ["TEXT", "Can convert batteries to lower voltages"],
  //         ["TEXT", "Powers vehicle ancillaries such as lights & radios"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-DCDCs.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "12-14V", "description": "OUTPUT VOLTAGE"},
  //         {"topic": "500kW", "description": "POWER OUTPUT"},
  //         {"topic": "48 to 96V", "description": "OPERATING VOLTAGES"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> trainTexts = {
  //   "topic": "Trains",
  //   // "TextAreaSmallWithClip": [
  //   //   "50%",
  //   //   "of energy in Trains is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       //["TEXT", "Battery Packs"],
  //     ],
  //     "topic": "Turntide for Trains",
  //     "description":
  //         "We provide high-performance electrification components for rail hybrid and pure electric solutions to provide train manufacturers a risk-free path to carbon reduction.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Battery Packs",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Performance Lithium-ion NMC battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "SERIES SYSTEM VOLTAGE"},
  //         {"topic": "4.97-700kWh", "description": "CAPACITY"},
  //         {"topic": "Over 1000V", "description": "RAIL APPLICATIONS"}
  //       ],
  //     },
  //   ],
  // };
}
