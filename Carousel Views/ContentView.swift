//
//  ContentView.swift
//  Carousel Views
//
//  Created by Abdul R. Arraisi on 25/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CarouselsView(data: CardModelView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

