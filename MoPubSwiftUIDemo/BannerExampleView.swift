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
            Text("A Banner Ad")
                .padding()
            MoPubBannerView(adUnitID: "0ac59b0996d947309c33f59d6676399f", adSize: kMPPresetMaxAdSize50Height)
        }
    }
}

struct BannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BannerExampleView()
    }
}
