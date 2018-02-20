//
//  AppDelegate.swift
//  ToyFirebaseRemoteConfig
//
//  Created by Faiz Mokhtar on 07/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var remoteConfig: RemoteConfig?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

