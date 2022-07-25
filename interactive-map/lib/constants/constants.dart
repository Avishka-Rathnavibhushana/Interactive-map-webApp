import 'package:flutter/material.dart';

class AppColors {
  //colors
  static const Color white = Colors.white;

//Primary Palette
  static const Color night = Color(0xFF263349);
  static const Color sea = Color(0xFF003C71);

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
const dataAnimationGif = 'assets/animations/Data_animation_512.gif';
const dataCenterAirFlowGif = 'assets/animations/Data_Center_airflow.gif';

//pages
class Pages {
  static const home = 'home';

  static const buildings = 'buildings';
  static const motor = 'motor';
  static const motorToHome = 'motorToHome';
  static const map = 'map';

  static const school = 'Schools';
  static const bank = 'bank';
  static const grocery = 'grocery';
  static const dataCenter = 'dataCenter';
  static const fastfoods = 'fastfoods';
  static const werehouse = 'werehouse';
  static const retail = 'retail';

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

// Application texts
class TextsConstants {
  static const Map<String, dynamic> schoolTexts = {
    "topic": "Schools",
    "TextAreaSmallWithClip": [
      "64%",
      "of energy in school is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Schools",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
        "Prevent learning disruption",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> fastFoodTexts = {
    "topic": "Quick Serve Resturants",
    "TextAreaSmallWithClip": [
      "28%",
      "of restuarant energy costs are from HVAC on avarage",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Restaurants",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> bankTexts = {
    "topic": "Banks",
    "TextAreaSmallWithClip": [
      "40-60%",
      "of energy in bank branches is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Banks",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> retailTexts = {
    "topic": "Retail Stores",
    "TextAreaSmallWithClip": [
      "70%",
      "of energy in retail is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Retail Stores",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> warehouseTexts = {
    "topic": "Warehouses",
    "TextAreaSmallWithClip": [
      "75%",
      "of energy in warehouses is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Warehouses",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> dataCentreTexts = {
    "topic": "Data Centers",
    "TextAreaSmallWithClip": [
      "37%",
      "of energy in data centers is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Data Centers",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };
  static const Map<String, dynamic> groceryShopTexts = {
    "topic": "Grocery Stores",
    "TextAreaSmallWithClip": [
      "50%",
      "of energy in grocery stores is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Grocery Stores",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Smart HVAC",
      "Energy-Saving Stratergies",
      "TurntideApp",
    ],
  };

  static const Map<String, dynamic> sportsCarTexts = {
    "topic": "Sports Cars",
    "TextAreaSmallWithClip": [
      "64%",
      "of energy in sports Car is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for EVs",
      "description":
          "High performance motors and inverters featuring class leading power density (35kW/l for inverters, 6kW/kg for motors) and high levels of functional safety.",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
        "Prevent learning disruption",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> tractorTexts = {
    "topic": "Tractors",
    "TextAreaSmallWithClip": [
      "28%",
      "of tractor energy costs are from HVAC on avarage",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Tractors",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Fan assemblies",
      "Inverters",
      "Mortors",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> avgNarmTexts = {
    "topic": "AGV / AMRs",
    "TextAreaSmallWithClip": [
      "40-60%",
      "of energy in AGV / AMR branches is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for AGV / AMRs",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Battery loop",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> truckTexts = {
    "topic": "Trucks",
    "TextAreaSmallWithClip": [
      "70%",
      "of energy in Truck is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Trucks",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Fan assemblies",
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> busTexts = {
    "topic": "Buses",
    "TextAreaSmallWithClip": [
      "75%",
      "of energy in Buses is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Buses",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Fan assemblies",
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> excavatorTexts = {
    "topic": "Excavators",
    "TextAreaSmallWithClip": [
      "37%",
      "of energy in Excavators is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Excavators",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Battery loop",
      "Drive loop",
      "DCDC Converter",
      "HD Mortor",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
  static const Map<String, dynamic> trainTexts = {
    "topic": "Trains",
    "TextAreaSmallWithClip": [
      "50%",
      "of energy in Trains is used by HVAC and lightning",
    ],
    "TextAreaWithClipMain": {
      "texts": [
        "Smart Motor System",
        "Smart HVAC",
        "Smart Building Operations",
      ],
      "topic": "Turntide for Trains",
      "description":
          "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
    },
    "TextAreaWithClipEnergySaving": {
      "texts": [
        "Improve energy efficiency",
        "Maintain a comfortable environment",
        "Automate lighting and HVAC",
        "Extent equipment life",
      ],
      "topic": "Stratergies for Sustainable Operations",
      "description": "",
    },
    "subTopics": [
      "Train Battery loop",
    ],
    "subTopicsInside": [
      {
        "topic": "Smart Motor System - V Series",
        "subTopic": "Includes: Smart Motor, Motor Controller, and Hub",
        "descriptioTexts": [
          "Optimal efficiency switched reluctance motor",
          "Standerd NEMA dimensions",
          "Available in 1-10 HP",
        ],
        "blocks": [
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
          {"topic": "93.2%", "description": "PEAK MOTOR EFFICIENCY"},
        ],
      },
    ],
  };
}
