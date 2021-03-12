//
//  BannerExampleView.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/11/21.
//

import SwiftUI
import MoPubSDK

struct BannerExampleView: View {
    var body: some View {
        VStack{
            Text("320x50 Banner")
                .padding()
            MoPubBannerView(adUnitID: "0ac59b0996d947309c33f59d6676399f", adSize: CGSize(width: 320, height: 50))
            
            
        }.navigationTitle("Banners")
    }
}

struct BannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BannerExampleView()
    }
}
