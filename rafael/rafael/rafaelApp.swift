//
//  rafaelApp.swift
//  rafael
//
//  Created by builder on 1/21/24.
//

import SwiftUI

struct rafaelApp: App {
    var body: some Scene {
        WindowGroup {
                    }
    }
}

import UIKit
import FirebaseCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
