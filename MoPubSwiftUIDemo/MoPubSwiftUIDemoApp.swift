//
//  MoPubSwiftUIDemoApp.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/10/21.
//

import SwiftUI
import MoPubSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //Initialize Mopub
        let sdkConfig = MPMoPubConfiguration(adUnitIdForAppInitialization: "0ac59b0996d947309c33f59d6676399f")
        sdkConfig.loggingLevel = .info
        MoPub.sharedInstance().initializeSdk(with: sdkConfig)
        
        return true
    }
}

@main
struct MoPubSwiftUIDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
