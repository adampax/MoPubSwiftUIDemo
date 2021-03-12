//
//  InterstitialExampleView.swift
//  MoPubSwiftUIDemo
//
//  Created by Adam Paxton on 3/11/21.
//

import SwiftUI

struct InterstitialExampleView: View {
    @State private var interstitial : Interstitial!
    @State var textValue = "Show Interstitial"

    var body: some View {
        Button(action: {
            
            self.interstitial.showAd {
            
                print("this is called after the interstial is shown")
                self.textValue = "Done"
            }
        }) {
            Text(self.textValue)
            
            .onAppear {
                self.interstitial = Interstitial()
            }
        }.padding()
    }
}

struct InterstitialExampleView_Previews: PreviewProvider {
    static var previews: some View {
        InterstitialExampleView()
    }
}
