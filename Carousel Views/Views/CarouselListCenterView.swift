//
//  CarouselListView.swift
//  Carousel Views
//
//  Created by Abdul R. Arraisi on 25/12/20.
//

import SwiftUI

struct CarouselListCenterView: View {
    
    /* Carousel Variables */
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let spacing: CGFloat
    
    @Binding var data: [Card]
    @Binding var itemIndex : CGFloat
    
    @State var firstItemPosition : CGFloat = 0
    @State var currentItemPosition : CGFloat = 0
    
    var body: some View {
        VStack{
            
            HStack(spacing: self.spacing){
                
                ForEach(data) { i in
                    
                    CardView(data: i, itemWidth: itemWidth, itemHeight: itemHeight)
                        .offset(x: self.currentItemPosition)
                        .highPriorityGesture(
                            
                            DragGesture()
                                .onChanged({ (value) in
                                    
                                    if value.translation.width > 0 {
                                        self.currentItemPosition = value.location.x
                                    }
                                    else {
                                        self.currentItemPosition = value.location.x - self.itemWidth
                                    }
                                    
                                })
                                .onEnded(onDragEnded)
                        )
                }
            }
            .frame(width: self.itemWidth)
            .offset(x: self.firstItemPosition)
            
        }
        .animation(.spring())
        .onAppear {
            let offsetFirstItem = ((self.itemWidth + self.spacing) * CGFloat(self.data.count / 2))
            let offsetMiddleItem = (self.data.count % 2 == 0 ? ((self.itemWidth + self.spacing) / 2) : 0)
            self.firstItemPosition = offsetFirstItem - offsetMiddleItem
        }
        .onChange(of: itemIndex, perform: { value in // action untuk merubah posisi sesuai item index
            self.updateHeight(value: Int(self.itemIndex))
            // Delay of 0.05 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.currentItemPosition = firstItemPosition * value * -1
            }
        })
    }
    
    // MARK: - ON DRAG ENDED
    private func onDragEnded(value: DragGesture.Value) {
        
        if value.translation.width > 0 {
            
            if value.translation.width > ((self.itemWidth - 80) / 2) && Int(self.itemIndex) != 0 {
                
                self.itemIndex -= 1
                self.updateHeight(value: Int(self.itemIndex))
                self.currentItemPosition = -((self.itemWidth + self.spacing) * self.itemIndex)
            }
            else{
                self.currentItemPosition = -((self.itemWidth + self.spacing) * self.itemIndex)
            }
            
        }
        else{
            
            if -value.translation.width > ((self.itemWidth - 80) / 2) && Int(self.itemIndex) !=  (self.data.count - 1){
                
                self.itemIndex += 1
                self.updateHeight(value: Int(self.itemIndex))
                self.currentItemPosition = -((self.itemWidth + self.spacing) * self.itemIndex)
            }
            else{
                
                self.currentItemPosition = -((self.itemWidth + self.spacing) * self.itemIndex)
            }
            
        }
    }
    
    // MARK: - UPDATE HEIGHT
    private func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct CarouselListView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselListCenterView(itemWidth: UIScreen.main.bounds.width-80, itemHeight: UIScreen.main.bounds.width*0.6, spacing: 20,
                         data: .constant([
                            Card(id: 0, img: "ios11", name: "", show: false),
                            Card(id: 1, img: "bigsur", name: "", show: false),
                            Card(id: 2, img: "mojave", name: "", show: false)
                         ]),
                         itemIndex: .constant(0))
    }
}
