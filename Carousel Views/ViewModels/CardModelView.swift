//
//  CardModelView.swift
//  Carousel Views
//
//  Created by Abdul R. Arraisi on 25/12/20.
//

import Foundation
import Combine

class CardModelView: ObservableObject {
    @Published var cardData = [
        Card(id: 0, img: "ios11", name: "Jill", show: true),
        Card(id: 1, img: "bigsur", name: "Emma", show: false),
        Card(id: 2, img: "mojave", name: "Catherine", show: false)
    ]
}
