//
//  CardView.swift
//  Carousel Views
//
//  Created by Abdul R. Arraisi on 25/12/20.
//

import SwiftUI

struct CardView: View {
    var data : Card
    var itemWidth : CGFloat
    var itemHeight : CGFloat
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            Image(data.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: itemWidth, height: data.show ? itemHeight : itemHeight - 20)
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(data: Card(id: 0, img: "", name: "", show: false), itemWidth: UIScreen.main.bounds.width-30, itemHeight: UIScreen.main.bounds.width*0.6)
    }
}
