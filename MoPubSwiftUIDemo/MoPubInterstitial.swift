//
//  MoPubInterstitial.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/11/21.
//

import SwiftUI
import MoPubSDK
import UIKit

final class Interstitial:NSObject, MPInterstitialAdControllerDelegate {
    
    var interstitialID = "4f117153f5c24fa6a3a92b818a5eb630"
    var interstitial: MPInterstitialAdController
    
    override init() {
        
        self.interstitial = MPInterstitialAdController(forAdUnitId: self.interstitialID)
        super.init()
        self.interstitial.delegate = self
        
        self.interstitial.loadAd()
        
    }
    
    func showAd(then sheet:(() -> Void)?){
        if self.interstitial.ready{
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstitial.show(from: root!)
            
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("interstitialDidDismiss"), object: nil, queue: nil) { (_) in
                if let presentSheet = sheet {
                    presentSheet()
                }
            }
        }
        else{
            print("Not Ready")
            if let presentSheet = sheet {
                presentSheet()
            }
        }
    }
    
    func interstitialDidDismiss(_ ad: MPInterstitialAdController) {
        
        
        NotificationCenter.default.post(name: NSNotification.Name("interstitialDidDismiss"), object: nil)
    }
}
