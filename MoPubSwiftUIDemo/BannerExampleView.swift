//
//  BannerExampleView.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/11/21.
//

import SwiftUI

struct BannerExampleView: View {
    var body: some View {
        VStack{
            Text("320x50 Banner")
                .padding()
            MoPubBannerView(adUnitID: "0ac59b0996d947309c33f59d6676399f", adSize: CGSize(width: 320, height: 50))
            
            Text("320x250 Banner (MRect)")
                .padding()
            MoPubBannerView(adUnitID: "2aae44d2ab91424d9850870af33e5af7", adSize: CGSize(width: 320, height: 250))
            
        }.navigationTitle("Banners")
    }
}

struct BannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BannerExampleView()
    }
}
