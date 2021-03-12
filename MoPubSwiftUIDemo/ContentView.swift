//
//  ContentView.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/10/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List{
                NavigationLink(
                  destination: BannerExampleView()) {
                    Text("Banner Ad")
                }
                NavigationLink(
                  destination: InterstitialExampleView()) {
                    Text("Interstitial Ad")
                }
            }
            .navigationTitle("MoPub Demos")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
