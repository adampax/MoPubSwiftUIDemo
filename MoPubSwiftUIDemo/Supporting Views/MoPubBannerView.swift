//
//  MoPubBannerView.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/10/21.
//

import MoPubSDK
import SwiftUI
import UIKit

fileprivate let ViewTag = 42
fileprivate let MoPubTestBannerId = "0ac59b0996d947309c33f59d6676399f"

struct MoPubBannerView: View {
    let adUnitID: String
    let adSize: CGSize
    
    var body: some View {
        
        MoPubBannerViewRepresentable(adUnitID: adUnitID, adSize: adSize)
            .frame(height: adSize.height)
    }
}

struct MoPubBannerViewRepresentable: UIViewControllerRepresentable {
    let adUnitID: String
    let adSize: CGSize
    
    
    func makeUIViewController(context: Context) -> CustomViewController {
        
        var adId: String
        
        #if targetEnvironment(simulator)
            adId = MoPubTestBannerId
        #else
            adId = adUnitID
        #endif
        
        let moPubBannerView = type(of: MPAdView()).init(adUnitId:adId)!
        
        let viewController = CustomViewController()
        
        viewController.view.frame.size.height = adSize.height

        
        moPubBannerView.frame = viewController.view.bounds
        
        moPubBannerView.delegate = context.coordinator
        
        moPubBannerView.tag = ViewTag
                
        //load banner after initialization
        viewController.view.addSubview(moPubBannerView)
        moPubBannerView.loadAd()
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: CustomViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, MPAdViewDelegate {
        
        private let parent: MoPubBannerViewRepresentable
        
        init(_ mopubView: MoPubBannerViewRepresentable) {
            self.parent = mopubView
        }
        
        func viewControllerForPresentingModalView() -> UIViewController! {
            return  UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        }
        
        //events from MPAdViewDelegate can go here
        func adViewDidLoadAd(_ view: MPAdView!, adSize: CGSize) {
            print("ad loaded with size: \(adSize)")
        }
    }
    
    //The CustomViewController is needed to track the orientation change and update the MPAdView bounds to match that of the parent view controller's
    class CustomViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()

            NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        }

        deinit {
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        }

        @objc func orientationDidChange() {
            
            //when device rotates, we need to reset the adView frame to match the parent view controller
            if let adView = view.viewWithTag(ViewTag) as? MPAdView {
                adView.frame = view.bounds
            }

        }

    }
}
