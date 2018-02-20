//
//  ViewController.swift
//  ToyFirebaseRemoteConfig
//
//  Created by Faiz Mokhtar on 07/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let config = RemoteConfigValues.sharedInstance

    view.backgroundColor = config.primaryColor()
    print("Promo enable: ", config.isPromoEnable())
  }
}

