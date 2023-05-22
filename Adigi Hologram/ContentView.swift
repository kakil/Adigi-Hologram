//
//  ContentView.swift
//  Adigi Hologram
//
//  Created by Kitwana Akil on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SunflowerView()
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
