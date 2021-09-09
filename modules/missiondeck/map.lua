-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local m = {
  [1] = {
    guid = "dfaa63",
    name = "Skirmish Map",
    cards = {}
  },
  [2] = {
    guid = "fd147c",
    name = "Mos Eisley Outskirts",
    cards = {"Get to the Ship", "Smuggled Goods"}
  },
  [3] = {
    guid = "4fbee3",
    name = "Moisture Farm",
    cards = {"Close to Home", "Raiding Party"}
  },
  [4] = {
    guid = "35e91c",
    name = "Massassi Ruins",
    cards = {"Lost Knowledge", "Leave No Evidence"}
  },
  [5] = {
    guid = "5ad128",
    name = "Corellian Underground",
    cards = {"Local Trouble", "Sabacc Standoff"}
  },
  [6] = {
    guid = "148cd8",
    name = "Imperial Labour Camp",
    cards = {"Prison Break", "Infiltration"}
  },
  [7] = {
    guid = "6aec32",
    name = "Geonosis Foundry",
    cards = {"Shadow War", "Weapons Project"}
  },
  [8] = {
    guid = "dc4a29",
    name = "Endor Wilderness",
    cards = {"Hazardous Materials", "Breakthrough"}
  },
  [9] = {
    guid = "5a540d",
    name = "Imperial Research Lab",
    cards = {"Stolen Schematics", "Stranded"}
  },
  [10] = {
    guid = "92d298",
    name = "Kuat Space Station",
    cards = {"Data Heist", "Incoming Transmission"}
  },
  [11] = {
    guid = "64ff68",
    name = "Ord Mantell Junkyard",
    cards = {"Mind of its Own", "Most Dangerous Game"}
  },
  [12] = {
    guid = "59292b",
    name = "Mos Eisley Cantina",
    cards = {"Drinks and Dealings", "Battlefield Engineering"}
  },
  [13] = {
    guid = "9e63bc",
    name = "Wasteland Outpost",
    cards = {"Ancient Knowledge", "Volatile Materials"}
  },
  [14] = {
    guid = "fd8985",
    name = "Tython Meditation Field",
    cards = {"Balance of the Force", "Chosen of the Force"}
  },
  [15] = {
    guid = "4b101e",
    name = "Imperial Space Station",
    cards = {"Data Run", "Targeting Computers"}
  },
  [16] = {
    guid = "9ba243",
    name = "Training Ground",
    cards = {"Reprogrammed", "Deception Game"}
  },
  [17] = {
    guid = "a21b19",
    name = "Development Facility",
    cards = {"The Art of Robotics", "Experimental Weapons"}
  },
  [18] = {
    guid = "599406",
    name = "Sewers of Nar Shaddaa",
    cards = {"Unknown Treasures", "Something in the Air"}
  },
  [19] = {
    guid = "e3fdcb",
    name = "Echo Base",
    cards = {"Safe and Sound", "Rapid Adaptation"}
  },
  [20] = {
    guid = "c92ab1",
    name = "Nelvaanian Warzone",
    cards = {"Fallout", "Constant Motion"}
  },
  [21] = {
    guid = "cf05d8",
    name = "Hoth Weather Shelter",
    cards = {"Payload", "Vital Supplies"}
  },
  [22] = {
    guid = "f4fcf9",
    name = "Climate Research Camp",
    cards = {"Fire-Fight", "Holding Ground"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {1.68, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-0.08, 1.00, -11.44},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {14.01, 1.00, 13.22},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {10.48, 1.00, -16.72},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {1.68, 1.00, 7.92},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-0.08, 1.00, -9.68},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {-8.88, 1.00, 9.68},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Mission Token",
          position = {-7.12, 1.00, -14.96},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
      },
      [2] = {
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.80,
      ["offsetY"] = 0.00,
    }
  },
  [23] = {
    guid = "7bb40a",
    name = "Hoth Battle Station",
    cards = {"Inside Job", "Bomb Drop"}
  },
  [24] = {
    guid = "095acc",
    name = "Imperial Command Hub",
    cards = {"Uplink", "Delivery System"}
  },
  [25] = {
    guid = "24eb68",
    name = "Coruscant Landfill",
    cards = {"Lair of the Dianoga", "One Man's Trash"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {-4.30, 1.00, 7.92},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-4.30, 1.00, -11.44},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-2.54, 1.00, 7.92},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-9.58, 1.00, 7.92},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {-0.78, 1.00, -0.88},
          rotation = {0.00, 270.00, 0.00}
        },
        [6] = {
          type = "Door",
          position = {-11.34, 1.00, -0.88},
          rotation = {0.00, 270.00, 0.00}
        }
      },
      [1] = {
        [2] = {
          type = "Mission Token",
          position = {-4.30, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Crate",
          position = {-0.78, 1.00, 0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Crate",
          position = {-0.78, 1.00, -6.16},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Crate",
          position = {-4.30, 1.00, 2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Crate",
          position = {-4.30, 1.00, -2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Crate",
          position = {-4.30, 1.00, -6.16},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Crate",
          position = {-6.06, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Crate",
          position = {-7.82, 1.00, 2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Crate",
          position = {-9.58, 1.00, -6.16},
          rotation = {0.00, 0.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.10,
      ["offsetY"] = 0.00,
    }
  },
  [26] = {
    guid = "2fa455",
    name = "Bespin Tibanna Facility",
    cards = {"Man in Carbonite", "Strategic Reserves"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {-10.83, 1.00, 6.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {-10.83, 1.00, -4.37},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-0.32, 1.00, 4.38},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-0.32, 1.00, -2.62},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {-12.58, 1.00, 9.63},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Terminal",
          position = {-14.33, 1.00, -11.38},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {-9.08, 1.00, 0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {-2.08, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {-0.33, 1.00, 0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {6.68, 1.00, -2.63},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {6.68, 1.00, 2.63},
          rotation = {0.00, 0.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.75,
      ["sizeY"] = 1.75,
      ["offsetX"] = 0.55,
      ["offsetY"] = 0.00,
    }
  },
  [27] = {
    guid = "55b631",
    name = "Lothal Safehouse",
    cards = {"\"Priceless\" Relics", "Illicit Reserves"}
  },
  [28] = {
    guid = "e4d2c5",
    name = "ISB Headquarters",
    cards = {"To Your Stations!", "Reconnaissance"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {-1.14, 1.00, -2.66},
          rotation = {0.00, 270.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {-4.66, 1.00, -2.66},
          rotation = {0.00, 270.00, 0.00}
        },
        [3] = {
          type = "Terminal",
          position = {-6.42, 1.00, 7.90},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Terminal",
          position = {4.14, 1.00, -7.94},
          rotation = {0.00, 270.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {2.38, 1.00, -9.70},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {-6.42, 1.00, -9.70},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {0.62, 1.00, 7.90},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {11.18, 1.00, 4.38},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [2] = {
          type = "Mission Token",
          position = {11.18, 1.50, 4.38},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [3] = {
          type = "Mission Token",
          position = {11.18, 2.00, 4.38},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [4] = {
          type = "Mission Token",
          position = {11.18, 2.50, 4.38},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [5] = {
          type = "Mission Token",
          position = {11.18, 3.00, 4.38},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [6] = {
          type = "Mission Token",
          position = {-15.22, 1.00, 2.62},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [7] = {
          type = "Mission Token",
          position = {-15.22, 1.50, 2.62},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [8] = {
          type = "Mission Token",
          position = {-15.22, 2.00, 2.62},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [9] = {
          type = "Mission Token",
          position = {-15.22, 2.50, 2.62},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [10] = {
          type = "Mission Token",
          position = {-15.22, 3.00, 2.62},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 1.50,
      ["offsetY"] = 1.74,
    }
  },
  [29] = {
    guid = "d1b02c",
    name = "ISB Training Grounds",
    cards = {"Counter-Slice", "Infiltration Games"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {-14.03, 1.00, 3.47},
          rotation = {0.00, 270.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {7.09, 1.00, 3.47},
          rotation = {0.00, 270.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-8.75, 1.00, -8.85},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {1.81, 1.00, -8.85},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {-10.51, 1.00, -10.61},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Terminal",
          position = {5.33, 1.00, -10.61},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Crate",
          position = {-19.31, 1.00, -1.81},
          rotation = {0.00, 270.00, 0.00},
          state = 3
        },
        [8] = {
          type = "Crate",
          position = {-19.31, 1.00, -7.09},
          rotation = {0.00, 270.00, 0.00},
          state = 3
        },
        [9] = {
          type = "Crate",
          position = {14.13, 1.00, -0.05},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [10] = {
          type = "Crate",
          position = {14.13, 1.00, -5.33},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {-8.75, 1.00, 10.51},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {3.57, 1.00, 10.51},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {-1.71, 1.00, -7.09},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {-3.47, 1.00, -8.85},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {-3.47, 1.00, 12.27},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {-1.71, 1.00, 12.27},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {-3.47, 1.00, 6.99},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {-1.71, 1.00, 6.99},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {-3.47, 1.00, -12.37},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-1.71, 1.00, -12.37},
          rotation = {0.00, 0.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.93,
      ["offsetY"] = 0.83,
    }
  },
  [30] = {
    guid = "86cdc2",
    name = "Wasskah Hunting Ground",
    cards = {"Scavengers", "Watch Your Step"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {-6.92, 1.00, 5.32},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {1.88, 1.00, 1.80},
          rotation = {0.00, 270.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {8.92, 1.00, 7.08},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {12.44, 1.00, 1.80},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {0.12, 1.00, -3.48},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Terminal",
          position = {14.20, 1.00, -1.72},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {-5.16, 1.00, 5.32},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Mission Token",
          position = {7.16, 1.00, -1.72},
          rotation = {0.00, 0.00, 0.00}
        },
        [9] = {
          type = "Mission Token",
          position = {8.92, 1.00, -7.00},
          rotation = {0.00, 0.00, 0.00}
        },
      },
      [1] = {
      },
      [2] = {
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 1.00,
      ["offsetY"] = 0.92,
    }
  },
  [31] = {
    guid = "7e5186",
    name = "Anchorhead Bar",
    cards = {"Gaining Favor", "Line of Fire"}
  },
  [32] = {
    guid = "b11315",
    name = "Kashyyyk Station",
    cards = {"True Data", "Heavy Firepower"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {-7.02, 1.00, 1.68},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [2] = {
          type = "Terminal",
          position = {1.78, 1.00, -8.88},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {-19.34, 1.00, 5.20},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {-14.06, 1.00, 3.44},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {-1.74, 1.00, -3.60},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {0.02, 1.00, -1.84},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {5.30, 1.00, -1.84},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {8.82, 1.00, -0.08},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Faction Token",
          position = {-8.78, 1.00, 6.96},
          rotation = {0.00, 180.00, 0.00},
          state = 1
        },
        [2] = {
          type = "Faction Token",
          position = {-3.50, 1.00, -5.36},
          rotation = {0.00, 180.00, 0.00},
          state = 1
        },
        [3] = {
          type = "Faction Token",
          position = {0.02, 1.00, -0.08},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [4] = {
          type = "Faction Token",
          position = {7.06, 1.00, -3.60},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.90,
      ["offsetY"] = 0.80,
    }
  },
  [33] = {
    guid = "f9117f",
    name = "Hangar Bay",
    cards = {"The Hunted", "Fortifications"}
  },
  [34] = {
    guid = "32df02",
    name = "The Pit of Carkoon",
    cards = {"Desert Dangers", "Battle for the Khetanna"}
  },
  [35] = {
    guid = "85826c",
    name = "The Dune Sea",
    cards = {"Power Surge", "Supply Raid"}
  },
  [36] = {
    guid = "46768c",
    name = "Nal Hutta Swamps",
    cards = {"Shielded", "Raining Freight"}
  },
  [37] = {
    guid = "b08609",
    name = "Endor Defense Station",
    cards = {"Renovation", "Claim the Ruins"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {-3.92, 1.00, -7.00},
          rotation = {0.00, 270.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {3.12, 1.00, -7.00},
          rotation = {0.00, 270.00, 0.00}
        },
        [3] = {
          type = "Terminal",
          position = {-5.68, 1.00, -3.50},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Terminal",
          position = {6.64, 1.00, -3.50},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {1.36, 1.00, 15.76},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {1.36, 1.00, 7.01},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Faction Token",
          position = {-7.45, 1.00, 10.45},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [2] = {
          type = "Faction Token",
          position = {10.10, 1.00, 8.75},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [3] = {
          type = "Faction Token",
          position = {-3.85, 1.00, -3.45},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [4] = {
          type = "Faction Token",
          position = {4.75, 1.00, -3.45},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [5] = {
          type = "Faction Token",
          position = {-0.40, 1.00, -15.70},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        }
      },
      [2] = {
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.75,
      ["offsetX"] = 0.48,
      ["offsetY"] = 0.88,
    }
  },
  [38] = {
    guid = "42b182",
    name = "Jabba's Palace",
    cards = {"Spoils of Crime", "New Ownership"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {-1.80, 1.00, 6.90},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-0.00, 1.00, -8.90},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-10.59, 1.00, -5.41},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-10.59, 1.00, 5.15},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {5.25, 1.00, -0.13},
          rotation = {0.00, 270.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-14.11, 1.00, -0.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {-14.11, 1.00, -1.89},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Faction Token",
          position = {14.05, 1.00, -0.13},
          rotation = {0.00, 90.00, 180.00},
          state = 2
        }
      },
      [1] = {
        [1] = {
          type = "Crate",
          position = {-19.39, 1.00, -1.89},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Crate",
          position = {-8.83, 1.00, -0.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Crate",
          position = {1.73, 1.00, 1.63},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Crate",
          position = {8.77, 1.00, -5.41},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Crate",
          position = {12.29, 1.00, -5.41},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Crate",
          position = {15.81, 1.00, 5.15},
          rotation = {0.00, 0.00, 0.00}
        },
      },
      [2] = {
        [1] = {
          type = "Faction Token",
          position = {-17.63, 1.00, -0.13},
          rotation = {0.00, 90.00, 0.00},
          state = 2
        },
        [2] = {
          type = "Faction Token",
          position = {-7.07, 1.00, -1.89},
          rotation = {0.00, 90.00, 0.00},
          state = 2
        },
        [3] = {
          type = "Faction Token",
          position = {15.81, 1.00, -0.13},
          rotation = {0.00, 90.00, 0.00},
          state = 2
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.85,
      ["offsetY"] = 0.75,
    }
  },
  [39] = {
    guid = "1d8f3a",
    name = "Tarkin Initiative Labs",
    cards = {"Rogue AI", "Abandoned Research"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {-3.95, 1.00, 5.35},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-3.95, 1.00, -5.35},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-3.65, 1.00, 5.05},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-3.65, 1.00, -3.40},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {6.75, 1.00, 8.75},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Door",
          position = {6.75, 1.00, -7.00},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {-16.20, 1.00, 0.00},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [8] = {
          type = "Mission Token",
          position = {-7.40, 1.00, 0.00},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [9] = {
          type = "Mission Token",
          position = {1.35, 1.00, 0.00},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [10] = {
          type = "Mission Token",
          position = {6.60, 1.00, 0.00},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        }
      },
      [1] = {
        [1] = {
          type = "Strain Token",
          position = {-7.40, 2.00, 0.00},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {16.00, 1.00, -8.00},
          rotation = {0.00, 0.00, 0.00}
        },
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {8.30, 1.00, 1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {8.30, 1.00, -1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {1.35, 1.00, 1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {1.35, 1.00, -1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {-10.95, 1.00, 1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-10.95, 1.00, -1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {-19.70, 1.00, 1.80},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Mission Token",
          position = {-19.70, 1.00, -1.80},
          rotation = {0.00, 0.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.75,
      ["sizeY"] = 1.75,
      ["offsetX"] = 0.50,
      ["offsetY"] = 0.95,
    }
  },
  [40] = {
    guid = "4e7b51",
    name = "Mos Eisley Back Alleys",
    cards = {"Stashed Away", "Concealed Treasures"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {0.02, 1.00, -6.16},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-7.02, 1.00, 6.16},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {1.78, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-3.50, 1.00, -7.92},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {-7.02, 1.00, 2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Door",
          position = {-5.26, 1.00, 9.68},
          rotation = {0.00, 270.00, 0.00}
        },
        [7] = {
          type = "Crate",
          position = {7.06, 1.00, 6.16},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Crate",
          position = {-1.74, 1.00, 7.92},
          rotation = {0.00, 0.00, 0.00}
        },
        [9] = {
          type = "Crate",
          position = {-1.74, 1.00, 0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [10] = {
          type = "Crate",
          position = {-5.26, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [11] = {
          type = "Crate",
          position = {-5.26, 1.00, -9.68},
          rotation = {0.00, 0.00, 0.00}
        },
        [12] = {
          type = "Crate",
          position = {-14.06, 1.00, -7.92},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Faction Token",
          position = {8.82, 1.00, -7.92},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [2] = {
          type = "Faction Token",
          position = {-15.82, 1.00, 7.92},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        }
      },
      [2] = {
        [1] = {
          type = "Crate",
          position = {-3.50, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Crate",
          position = {-3.50, 1.00, 0.88},
          rotation = {0.00, 0.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.90,
      ["offsetY"] = 0.00,
    }
  },
  [41] = {
    guid = "80ab00",
    name = "Chopper Base, Atollion",
    cards = {"Krykna Infestation", "Powered Perimeter"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {9.30, 1.00, 6.59},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-9.30, 1.00, -6.94},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {7.55, 1.00, -6.76},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-0.87, 1.00, 1.71},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {-9.32, 1.00, 8.42},
          rotation = {0.00, 270.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-14.37, 1.00, 4.90},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [7] = {
          type = "Mission Token",
          position = {-14.37, 1.00, -3.56},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [8] = {
          type = "Mission Token",
          position = {-4.23, 1.00, 1.52},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [9] = {
          type = "Mission Token",
          position = {4.23, 1.00, -1.87},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [10] = {
          type = "Mission Token",
          position = {14.37, 1.00, 3.21},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [11] = {
          type = "Mission Token",
          position = {14.37, 1.00, -5.25},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
      },
      [1] = {
      },
      [2] = {
        [11] = {
          type = "Mission Token",
          position = {-7.61, 1.00, 16.73},
          rotation = {0.00, 0.00, 0.00},
        },
      }
    },
    grid = {
      ["sizeX"] = 1.69,
      ["sizeY"] = 1.69,
      ["offsetX"] = 0.00,
      ["offsetY"] = 0.67,
    }
  },
  [42] = {
    guid = "85d64a",
    name = "30th Floor Plaza",
    cards = {"Overwatch", "On Our Way"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {12.40, 1.00, -12.34},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-5.20, 1.00, 12.30},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {7.12, 1.00, 1.74},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {5.36, 1.00, -8.82},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {0.08, 1.00, 10.54},
          rotation = {0.00, 270.00, 0.00}
        },
        [6] = {
          type = "Door",
          position = {0.08, 1.00, 1.74},
          rotation = {0.00, 270.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {5.36, 1.00, 10.54},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {7.12, 1.00, 3.50},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {1.84, 1.00, -1.78},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {1.84, 1.00, -10.58},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {10.64, 1.00, -3.54},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-3.44, 1.00, 1.74},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {17.68, 1.00, 10.54},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {17.68, 1.00, -8.82},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {-10.48, 1.00, 8.78},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {-10.48, 1.00, -8.82},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {19.44, 1.00, -12.34},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [6] = {
          type = "Mission Token",
          position = {17.68, 1.00, -12.34},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        },
        [7] = {
          type = "Mission Token",
          position = {-10.48, 1.00, -12.34},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        },
        [8] = {
          type = "Mission Token",
          position = {-12.24, 1.00, -12.34},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.96,
      ["offsetY"] = 0.86,
    }
  },
  [43] = {
    guid = "a728ee",
    name = "Uscru Entertainment District",
    cards = {"Priority Message", "Lost and Found"}
  },
  [44] = {
    guid = "696f73",
    name = "Coruscant Back Alleys",
    cards = {"The Triple Cross", "Propaganda War"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {4.20, 1.00, 6.95},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {-2.85, 1.00, 7.30},
          rotation = {0.00, 90.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-4.85, 1.00, 6.75},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-1.35, 1.00, -0.20},
          rotation = {0.00, 90.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {0.45, 1.00, -5.40},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Terminal",
          position = {9.30, 1.00, 7.10},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {12.70, 1.00, 1.70},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {5.80, 1.00, -1.75},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {3.90, 1.00, -10.50},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Faction Token",
          position = {-6.45, 1.00, 8.65},
          rotation = {0.00, 180.00, 0.00}
        },
        [2] = {
          type = "Faction Token",
          position = {2.25, 1.00, 1.75},
          rotation = {0.00, 180.00, 0.00}
        },
        [3] = {
          type = "Faction Token",
          position = {5.80, 1.00, -0.05},
          rotation = {0.00, 180.00, 0.00}
        },
        [4] = {
          type = "Faction Token",
          position = {16.20, 1.00, -5.35},
          rotation = {0.00, 180.00, 0.00}
        },
        [5] = {
          type = "Faction Token",
          position = {-4.90, 1.00, 7.05},
          rotation = {0.00, 180.00, 180.00}
        },
        [6] = {
          type = "Faction Token",
          position = {0.45, 1.00, 1.70},
          rotation = {0.00, 180.00, 180.00}
        },
        [7] = {
          type = "Faction Token",
          position = {4.05, 1.00, -0.05},
          rotation = {0.00, 180.00, 180.00}
        },
        [8] = {
          type = "Faction Token",
          position = {11.10, 1.00, -10.45},
          rotation = {0.00, 180.00, 180.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.76,
      ["offsetX"] = 1.35,
      ["offsetY"] = 0.85,
    }
  },
  [45] = {
    guid = "233657",
    name = "Coruscant Senate Office",
    cards = {"Battle at Dawn", "Priority Extraction"},
    items = {
      always = {
        [1] = {
          type = "Door",
          position = {9.33, 1.00, 7.88},
          rotation = {0.00, 270.00, 0.00}
        },
        [2] = {
          type = "Door",
          position = {-4.67, 1.00, 7.88},
          rotation = {0.00, 270.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {7.57, 1.00, -7.88},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-2.93, 1.00, -7.88},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Terminal",
          position = {-11.68, 1.00, 7.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Terminal",
          position = {18.08, 1.00, -11.38},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [1] = {
        [1] = {
          type = "Mission Token",
          position = {12.83, 1.00, -2.63},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Mission Token",
          position = {-8.18, 1.00, -0.87},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {2.33, 1.00, 13.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [4] = {
          type = "Mission Token",
          position = {4.08, 1.00, 13.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [5] = {
          type = "Mission Token",
          position = {7.58, 1.00, 7.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Mission Token",
          position = {-1.18, 1.00, 7.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [7] = {
          type = "Mission Token",
          position = {4.08, 1.00, -13.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Mission Token",
          position = {2.33, 1.00, -13.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [9] = {
          type = "Mission Token",
          position = {5.83, 1.00, -6.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [10] = {
          type = "Mission Token",
          position = {0.58, 1.00, -6.13},
          rotation = {0.00, 0.00, 0.00}
        },
        [11] = {
          type = "Mission Token",
          position = {25.00, 1.00, 0.90},
          rotation = {0.00, 0.00, 0.00}
        },
        [12] = {
          type = "Mission Token",
          position = {25.00, 1.50, 0.00},
          rotation = {0.00, 0.00, 0.00}
        },
        [13] = {
          type = "Mission Token",
          position = {25.00, 2.00, -0.90},
          rotation = {0.00, 0.00, 0.00}
        }
      },
      [2] = {
        [1] = {
          type = "Faction Token",
          position = {14.58, 1.00, 0.88},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [2] = {
          type = "Faction Token",
          position = {19.83, 1.00, -0.88},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [3] = {
          type = "Faction Token",
          position = {19.83, 1.00, -4.38},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [4] = {
          type = "Faction Token",
          position = {-13.43, 1.00, 0.88},
          rotation = {0.00, 180.00, 0.00}
        },
        [5] = {
          type = "Faction Token",
          position = {-15.18, 1.00, -2.63},
          rotation = {0.00, 180.00, 0.00}
        },
        [6] = {
          type = "Faction Token",
          position = {-13.43, 1.00, -4.38},
          rotation = {0.00, 180.00, 0.00}
        }
      }
    },
    grid = {
      ["sizeX"] = 1.75,
      ["sizeY"] = 1.75,
      ["offsetX"] = 1.45,
      ["offsetY"] = 0.00,
    }
  },
  [46] = {
    guid = "aa3402",
    name = "Lothal Wastes",
    cards = {"Blitz", "Fluctuations"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {-6.10, 1.00, -10.65},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {7.90, 1.00, -10.65},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Mission Token",
          position = {11.30, 1.00, -14.05},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [4] = {
          type = "Mission Token",
          position = {-9.60, 1.00, -14.05},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [5] = {
          type = "Mission Token",
          position = {6.05, 1.00, -5.35},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [6] = {
          type = "Mission Token",
          position = {-7.80, 1.00, -5.35},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [7] = {
          type = "Mission Token",
          position = {4.35, 1.00, 5.20},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        },
        [8] = {
          type = "Mission Token",
          position = {-6.15, 1.00, 5.20},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        },
        [9] = {
          type = "Mission Token",
          position = {2.50, 1.00, 10.55},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [10] = {
          type = "Mission Token",
          position = {-2.65, 1.00, 10.60},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        }
      },
      [1] = {
      },
      [2] = {
      }
    },
    grid = {
      ["sizeX"] = 1.75,
      ["sizeY"] = 1.75,
      ["offsetX"] = 1.73,
      ["offsetY"] = 0.85,
    }
  },
  [47] = {
    guid = "2b7a52",
    name = "Lothal Battlefront",
    cards = {"Power Play", "Rise Up"}
  },
  [48] = {
    guid = "98e821",
    name = "Devaron Garrison",
    cards = {"Arms Salvage", "Secure Munitions"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {8.13, 1.00, -2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-18.13, 1.00, -2.64},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-2.37, 1.00, 7.92},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {-9.38, 1.00, 7.92},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {-4.13, 1.00, -0.88},
          rotation = {0.00, 0.00, 0.00}
        },
        [6] = {
          type = "Crate",
          position = {-4.13, 1.00, 7.92},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [7] = {
          type = "Crate",
          position = {-5.88, 1.00, 6.16},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [8] = {
          type = "Crate",
          position = {-2.38, 1.00, -7.92},
          rotation = {0.00, 90.00, 0.00},
          state = 2
        },
        [9] = {
          type = "Crate",
          position = {-9.38, 1.00, -7.92},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [10] = {
          type = "Crate",
          position = {-5.88, 1.00, -11.44},
          rotation = {0.00, 0.00, 0.00},
          state = 5
        }
      },
      [1] = {
      },
      [2] = {
      }
    },
    grid = {
      ["sizeX"] = 1.75,
      ["sizeY"] = 1.76,
      ["offsetX"] = 0.25,
      ["offsetY"] = 0.00,
    }
  },
  [49] = {
    guid = "bbdbf5",
    name = "Lothal Spaceport",
    cards = {"Market Sabotage", "Mortar Fire"},
    items = {
      always = {
        [1] = {
          type = "Terminal",
          position = {14.82, 1.00, 0.93},
          rotation = {0.00, 0.00, 0.00}
        },
        [2] = {
          type = "Terminal",
          position = {-9.82, 1.00, -4.33},
          rotation = {0.00, 0.00, 0.00}
        },
        [3] = {
          type = "Door",
          position = {-1.05, 1.00, 9.95},
          rotation = {0.00, 270.00, 0.00}
        },
        [4] = {
          type = "Door",
          position = {4.29, 1.00, 2.77},
          rotation = {0.00, 270.00, 0.00}
        },
        [5] = {
          type = "Door",
          position = {-2.82, 1.00, -0.71},
          rotation = {0.00, 270.00, 0.00}
        },
        [6] = {
          type = "Door",
          position = {4.27, 1.00, -7.74},
          rotation = {0.00, 270.00, 0.00}
        },
        [7] = {
          type = "Crate",
          position = {2.50, 1.00, 9.68},
          rotation = {0.00, 0.00, 0.00}
        },
        [8] = {
          type = "Crate",
          position = {-4.54, 1.00, 2.68},
          rotation = {0.00, 0.00, 0.00}
        },
        [9] = {
          type = "Crate",
          position = {2.50, 1.00, 0.93},
          rotation = {0.00, 0.00, 0.00}
        },
        [10] = {
          type = "Crate",
          position = {7.78, 1.00, -2.58},
          rotation = {0.00, 0.00, 0.00}
        },
        [11] = {
          type = "Crate",
          position = {2.50, 1.00, -7.83},
          rotation = {0.00, 0.00, 0.00}
        },
        [12] = {
          type = "Faction Token",
          position = {-9.82, 1.00, 7.93},
          rotation = {0.00, 180.00, 0.00},
          state = 2
        },
        [13] = {
          type = "Faction Token",
          position = {14.82, 1.00, -7.83},
          rotation = {0.00, 180.00, 0.00},
          state = 1
        },
      },
      [1] = {
      },
      [2] = {
        [1] = {
          type = "Mission Token",
          position = {13.06, 1.00, 11.43},
          rotation = {0.00, 0.00, 0.00},
          state = 3
        },
        [2] = {
          type = "Mission Token",
          position = {13.06, 1.00, 13.18},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        },
        [3] = {
          type = "Mission Token",
          position = {-8.06, 1.00, -11.33},
          rotation = {0.00, 0.00, 0.00},
          state = 2
        },
        [4] = {
          type = "Mission Token",
          position = {-8.06, 1.00, -13.08},
          rotation = {0.00, 0.00, 0.00},
          state = 4
        }
      }
    },
    grid = {
      ["sizeX"] = 1.76,
      ["sizeY"] = 1.75,
      ["offsetX"] = 1.62,
      ["offsetY"] = 0.05,
    }
  },
  [50] = {
    guid = "c663b1",
    name = "Imperial Tower",
    cards = {"Intruder Alert", "Close Contact"}
  }
}

return m
