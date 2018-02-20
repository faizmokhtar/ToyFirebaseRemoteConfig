//
//  RemoteConfig.swift
//  ToyFirebaseRemoteConfig
//
//  Created by Faiz Mokhtar on 07/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation
import Firebase

enum ValueKey: String {
  case promoEnable  = "promo_enable"
  case primaryColor = "primary_color"
}

class RemoteConfigValues {

  static let sharedInstance = RemoteConfigValues()

  private init() {
    loadValues()
    fetchValues()
  }

  func loadValues() {
    let appDefaults: [String: NSObject] = [
      ValueKey.promoEnable.rawValue : false as NSObject,
      ValueKey.primaryColor.rawValue: "#E3E3E3" as NSObject
    ]

    RemoteConfig.remoteConfig().setDefaults(appDefaults)
  }

  func fetchValues() {
    RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { [weak self] (status, error) in
      self?.activateDebugMode()
      guard error == nil else { fatalError("Error fetching remote config") }
      RemoteConfig.remoteConfig().activateFetched()
      print("Remote config values retrieved!")
    }
  }

  func activateDebugMode() {
    let debugSettings = RemoteConfigSettings(developerModeEnabled: true)!
    RemoteConfig.remoteConfig().configSettings = debugSettings
  }

  func isPromoEnable() -> Bool {
    let promoEnable = RemoteConfig.remoteConfig().configValue(forKey: ValueKey.promoEnable.rawValue).boolValue
    return promoEnable
  }

  func primaryColor() -> UIColor {
    let hex = RemoteConfig.remoteConfig().configValue(forKey: ValueKey.primaryColor.rawValue).stringValue
    return UIColor(hexString: hex ?? "#E3E3E3")
  }
}
