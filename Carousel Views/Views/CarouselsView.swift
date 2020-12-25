//
//  CarouselsView.swift
//  Carousel Views
//
//  Created by Abdul R. Arraisi on 25/12/20.
//

import SwiftUI

struct CarouselsView: View {
    
    /* Carousel Variables */
    @StateObject var data: CardModelView
    
    @State var itemIndexSnap : CGFloat = 0
    @State var itemIndexList : CGFloat = 0
    @State var itemIndexListCenter : CGFloat = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // STYLE 1
                VStack {
                    
                    HStack {
                        Text("Style 1")
                        Spacer()
                        Button(action: {
                            if Int(itemIndexSnap) < data.dataSnapCarousel.count-1 {
                                self.itemIndexSnap += 1
                            } else {
                                self.itemIndexSnap = 0
                            }
                        }, label: {
                            Text("Next")
                                .padding(5)
                        })
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    
                    CarouselSnapView(itemWidth: UIScreen.main.bounds.width-55, itemHeight: UIScreen.main.bounds.width*0.5, spacing: 55, data: $data.dataSnapCarousel, itemIndex: $itemIndexSnap)
                }
                
                // STYLE 2
                VStack {
                    
                    HStack {
                        Text("Style 2")
                        Spacer()
                        Button(action: {
                            if Int(itemIndexList) < data.dataList2Carousel.count-1 {
                                self.itemIndexList += 1
                            } else {
                                self.itemIndexList = 0
                            }
                        }, label: {
                            Text("Next")
                                .padding(5)
                        })
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    
                    CarouselListView(itemWidth: UIScreen.main.bounds.width-150, itemHeight: UIScreen.main.bounds.width*0.4, offset: 50, spacing: 30, data: $data.dataList2Carousel, itemIndex: $itemIndexList)
                }
                
                
                // STYLE 3
                VStack {
                    
                    HStack {
                        Text("Style 3")
                        Spacer()
                        Button(action: {
                            if Int(itemIndexListCenter) < data.dataListCenterCarousel.count-1 {
                                self.itemIndexListCenter += 1
                            } else {
                                self.itemIndexListCenter = 0
                            }
                        }, label: {
                            Text("Next")
                                .padding(5)
                        })
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    
                    
                    CarouselListCenterView(itemWidth: UIScreen.main.bounds.width-150, itemHeight: UIScreen.main.bounds.width*0.4, spacing: 35, data: $data.dataListCenterCarousel, itemIndex: $itemIndexListCenter)
                }
                
            }
            
            HStack {Spacer()}
        }
    }
}

struct CarouselsView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselsView(data: CardModelView())
    }
}
