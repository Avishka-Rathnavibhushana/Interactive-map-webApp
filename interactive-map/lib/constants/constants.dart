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
    // "TextAreaSmallWithClip": [
    //   "64%",
    //   "of energy in sports Car is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for EVs",
      "description":
          "High performance motors and inverters featuring class leading power density (35kW/l for inverters, 6kW/kg for motors) and high levels of functional safety.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //     "Prevent learning disruption",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "High Voltage High Power Drives",
        "subTopic":
            "Commercially available design for any automotive application",
        "descriptioTexts": [
          "Proven design allows fast implementation",
          "Reduction in validation test programs",
          "ISO26262 ASIL-D guaranteed safety standards",
        ],
        "blocks": [
          {"topic": "450V", "description": "Maximum voltage"},
          {"topic": "35kW/l", "description": "Peak power densities"},
          {"topic": "150kW", "description": "Peak power level"},
          {"topic": "25 kW/kg", "description": "Power to weight"},
        ],
      },
      {
        "topic": "High Power Density Motors",
        "subTopic":
            "For powertrain traction, generator and cooling fan operations",
        "descriptioTexts": [
          "Proven reliability",
          "Flexible, stackable design",
          "Excellent power & torque density for small spaces",
        ],
        "blocks": [
          {"topic": "800V", "description": "Maximum battery voltage"},
          {"topic": "100-800kW", "description": "7 sizes available"},
          {"topic": "96%", "description": "Peak efficiency"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> tractorTexts = {
    "topic": "Tractors",
    // "TextAreaSmallWithClip": [
    //   "28%",
    //   "of tractor energy costs are from HVAC on avarage",
    // ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for Electric Tractors",
      "description":
          "We'll deliver the intelligence, efficiency, and controls you need to build industry-leading vehicles, from tractors to combines, for years to come.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Fan assemblies",
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Pump & Fan Assemblies",
        "subTopic": "",
        "descriptioTexts": [
          "Electric pump and fan assemblies, from 500W to 60kW cooling solutions for hybrid and electric buses",
          "Sealless electric water pumps efficiently operate EV cooling circuits",
        ],
        "blocks": [
          {"topic": "24 / 48 / 750V", "description": "Operating voltage"},
          {"topic": "500-60kW", "description": "Power output"}
        ],
      },
      {
        "topic": "High Voltage High Power Drives",
        "subTopic":
            "Commercially available design for any automotive application",
        "descriptioTexts": [
          "Proven design allows fast implementation",
          "Reduction in validation test programs",
          "ISO26262 ASIL-D guaranteed safety standards",
        ],
        "blocks": [
          {"topic": "450V", "description": "Maximum voltage"},
          {"topic": "35kW/l", "description": "Peak power densities"},
          {"topic": "150kW", "description": "Peak power level"},
          {"topic": "25 kW/kg", "description": "Power to weight"},
        ],
      },
      {
        "topic": "High Power Density Motors",
        "subTopic":
            "For powertrain traction, generator and cooling fan operations",
        "descriptioTexts": [
          "Proven reliability",
          "Flexible, stackable design",
          "Excellent power & torque density for small spaces",
        ],
        "blocks": [
          {"topic": "800V", "description": "Maximum battery voltage"},
          {"topic": "100-800kW", "description": "7 sizes available"},
          {"topic": "96%", "description": "Peak efficiency"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> avgNarmTexts = {
    "topic": "Material Handling",
    // "TextAreaSmallWithClip": [
    //   "40-60%",
    //   "of energy in AGV / AMR branches is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for Material Handling",
      "description":
          "We offer electrification solutions to increase the productivity of warehouses and distribution centers and autonomous mobile robots (AMRs) and automatic guided vehicles (AGVs) by minimizing downtime and taking advantage of opportunity charging.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Battery Packs",
    ],
    "subTopicsInside": [
      {
        "topic": "High Performance Lithium-Ion NMB Battery",
        "subTopic": "With intelligent built-in battery management",
        "descriptioTexts": [
          "High energy density",
          "For rapid deployment & volume manufacture",
          "Flexible & scalable modular design",
        ],
        "blocks": [
          {"topic": "48-630V", "description": "Series system voltage"},
          {"topic": "4.97-700kWh", "description": "Capacity"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> truckTexts = {
    "topic": "Trucks",
    // "TextAreaSmallWithClip": [
    //   "70%",
    //   "of energy in Truck is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for Electric Trucks",
      "description":
          "From last-mile delivery to Class8 40T trucks we offer a range of highly reliable electrification solutions from high power electric traction drives to low power pumps fans and hotel loads to help you deliver your emissions targets.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Fan assemblies",
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Pump & Fan Assemblies",
        "subTopic": "",
        "descriptioTexts": [
          "Electric pump and fan assemblies, from 500W to 60kW cooling solutions for hybrid and electric buses",
          "Sealless electric water pumps efficiently operate EV cooling circuits",
        ],
        "blocks": [
          {"topic": "24 / 48 / 750V", "description": "Operating voltage"},
          {"topic": "500-60kW", "description": "Power output"}
        ],
      },
      {
        "topic": "High Voltage High Power Drives",
        "subTopic":
            "Commercially available design for any automotive application",
        "descriptioTexts": [
          "Proven design allows fast implementation",
          "Reduction in validation test programs",
          "ISO26262 ASIL-D guaranteed safety standards",
        ],
        "blocks": [
          {"topic": "450V", "description": "Maximum voltage"},
          {"topic": "35kW/l", "description": "Peak power densities"},
          {"topic": "150kW", "description": "Peak power level"},
          {"topic": "25 kW/kg", "description": "Power to weight"},
        ],
      },
      {
        "topic": "High Power Density Motors",
        "subTopic":
            "For powertrain traction, generator and cooling fan operations",
        "descriptioTexts": [
          "Proven reliability",
          "Flexible, stackable design",
          "Excellent power & torque density for small spaces",
        ],
        "blocks": [
          {"topic": "800V", "description": "Maximum battery voltage"},
          {"topic": "100-800kW", "description": "7 sizes available"},
          {"topic": "96%", "description": "Peak efficiency"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> busTexts = {
    "topic": "Buses",
    // "TextAreaSmallWithClip": [
    //   "75%",
    //   "of energy in Buses is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [],
      "topic": "Turntide for Electric Buses",
      "description":
          "We offer powertrain systems to satisfy on-road functional safety to ISO26262 ASIL-D with all the power and torque you need.\n\nSelect from a range of low voltage and high voltage pump and fan cooling solutions.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Pump and Fan assemblies",
      "Inverters",
      "Motors",
    ],
    "subTopicsInside": [
      {
        "topic": "Pump & Fan Assemblies",
        "subTopic": "",
        "descriptioTexts": [
          "Electric pump and fan assemblies, from 500W to 60kW cooling solutions for hybrid and electric buses",
          "Sealless electric water pumps efficiently operate EV cooling circuits",
        ],
        "blocks": [
          {"topic": "24 / 48 / 750V", "description": "Operating voltage"},
          {"topic": "500-60kW", "description": "Power output"}
        ],
      },
      {
        "topic": "High Voltage High Power Drives",
        "subTopic":
            "Commercially available design for any automotive application",
        "descriptioTexts": [
          "Proven design allows fast implementation",
          "Reduction in validation test programs",
          "ISO26262 ASIL-D guaranteed safety standards",
        ],
        "blocks": [
          {"topic": "450V", "description": "Maximum voltage"},
          {"topic": "35kW/l", "description": "Peak power densities"},
          {"topic": "150kW", "description": "Peak power level"},
          {"topic": "25 kW/kg", "description": "Power to weight"},
        ],
      },
      {
        "topic": "High Power Density Motors",
        "subTopic":
            "For powertrain traction, generator and cooling fan operations",
        "descriptioTexts": [
          "Proven reliability",
          "Flexible, stackable design",
          "Excellent power & torque density for small spaces",
        ],
        "blocks": [
          {"topic": "800V", "description": "Maximum battery voltage"},
          {"topic": "100-800kW", "description": "7 sizes available"},
          {"topic": "96%", "description": "Peak efficiency"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> excavatorTexts = {
    "topic": "Excavators",
    // "TextAreaSmallWithClip": [
    //   "37%",
    //   "of energy in Excavators is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [
        "Click here for case study",
      ],
      "topic": "Turntide for Construction",
      "description":
          "Whether building excavators or backhoes, we'll help you electrify your construction ehicles and get to market quickly and easily with a fully scalable powertrain solution.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Motors",
      "Battery Packs",
      "Inverters",
      "DC/DC Convertors",
    ],
    "subTopicsInside": [
      {
        "topic": "High Power Density Motors",
        "subTopic":
            "For powertrain traction, generator and cooling fan operations",
        "descriptioTexts": [
          "Proven reliability",
          "Flexible, stackable design",
          "Excellent power & torque density for small spaces",
        ],
        "blocks": [
          {"topic": "800V", "description": "Maximum battery voltage"},
          {"topic": "100-800kW", "description": "7 sizes available"},
          {"topic": "96%", "description": "Peak efficiency"}
        ],
      },
      {
        "topic": "High Performance Lithium-Ion NMB Battery",
        "subTopic": "With intelligent built-in battery management",
        "descriptioTexts": [
          "High energy density",
          "For rapid deployment & volume manufacture",
          "Flexible & scalable modular design",
        ],
        "blocks": [
          {"topic": "48-630V", "description": "Series system voltage"},
          {"topic": "4.97-700kWh", "description": "Capacity"}
        ],
      },
      {
        "topic": "Low Voltage Drives",
        "subTopic": "Powered mainstream EV's for over 10 years",
        "descriptioTexts": [
          "Proven reliability with almost 200,000 units shipped",
          "Supports a wide range of motor types",
          "Highly configurable operation & communications",
        ],
        "blocks": [
          {"topic": "900A", "description": "Peak current"},
          {"topic": "48-110V", "description": "Operating voltage"}
        ],
      },
      {
        "topic": "DC/DC Convertors",
        "subTopic":
            "Product range for low voltage electrification applications",
        "descriptioTexts": [
          "Low voltage and high voltage options",
          "Can convert batteries to lower voltages",
          "Powers vehicle ancillaries such as lights & radios",
        ],
        "blocks": [
          {"topic": "12-14V", "description": "Output voltage"},
          {"topic": "500-3.7kW", "description": "Power output"},
          {"topic": "48 to 450V", "description": "Operating voltages"}
        ],
      },
    ],
  };
  static const Map<String, dynamic> trainTexts = {
    "topic": "Trains",
    // "TextAreaSmallWithClip": [
    //   "50%",
    //   "of energy in Trains is used by HVAC and lightning",
    // ],
    "TextAreaWithClipMain": {
      "texts": [
        "Battery Packs",
      ],
      "topic": "Turntide for Trains",
      "description":
          "We provide high-performance electrification components for rail hybrid and pure electric solutions to provide train manufacturers a risk-free path to carbon reduction.",
    },
    // "TextAreaWithClipEnergySaving": {
    //   "texts": [
    //     "Improve energy efficiency",
    //     "Maintain a comfortable environment",
    //     "Automate lighting and HVAC",
    //     "Extent equipment life",
    //   ],
    //   "topic": "Stratergies for Sustainable Operations",
    //   "description": "",
    // },
    "subTopics": [
      "Battery Packs",
    ],
    "subTopicsInside": [
      {
        "topic": "High Performance Lithium-ion NMC battery",
        "subTopic": "With intelligent built-in battery management",
        "descriptioTexts": [
          "High energy density",
          "Flexible & scalable modular design",
          "For rapid deployment & volume manufacture",
        ],
        "blocks": [
          {"topic": "48-630V", "description": "Series system voltage"},
          {"topic": "4.97-700kWh", "description": "Capacity"},
          {"topic": "Over 1000V", "description": "Rail applications"}
        ],
      },
    ],
  };
}
