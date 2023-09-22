//
//  BeautifulBanner.swift
//  AnimatedCarousel
//
//  Created by JaeBin on 2023/09/22.
//

import SwiftUI
struct BeautifulBannerView<Content: View, Title: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    //
    var showIndicator: ScrollIndicatorVisibility = .hidden
    var spacing: CGFloat = 0
    
    @Binding var data: Item
    @ViewBuilder var text: (Binding<Item.Element>) -> Title
    @ViewBuilder var background: (Binding<Item.Element>) -> Content
    
    let titleScrollSpeed: CGFloat = 0.6
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach($data) { item in
                        ZStack {
                            background(item)
                            text(item)
                                .frame(maxWidth: .infinity)
                                .visualEffect { content, geometryProxy in
                                    content.offset(x: scrollOffset(geometryProxy))
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }.scrollTargetLayout() // Paging
            }
            
            .scrollIndicators(showIndicator)
            .scrollTargetBehavior(.viewAligned) //iOS 17
            
        }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

#Preview {
    BeautifulBannerExampleView()
}
