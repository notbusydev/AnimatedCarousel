//
//  CustomPagingView.swift
//  AnimatedCarousel
//
//  Created by JaeBin on 2023/09/22.
//

import SwiftUI
struct Item: Identifiable {
    private (set) var id: UUID = .init()
    var color: Color
    var title: String
    var subTitle: String
}


struct CustomPagingView<Content: View, Title: View, Item: RandomAccessCollection>: View where Item: MutableCollection, Item.Element: Identifiable {
    
    //
    var showIndicator: ScrollIndicatorVisibility = .hidden
    var spacing: CGFloat = 10
    
    @Binding var data: Item
    @ViewBuilder var title: (Binding<Item.Element>) -> Title
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    
    let titleScrollSpeed: CGFloat = 0.6
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach($data) { item in
                        VStack(spacing: 0) {
                            title(item)
                                .frame(maxWidth: .infinity)
                                .visualEffect { content, geometryProxy in
                                    content.offset(x: scrollOffset(geometryProxy))
                                }
                            content(item)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }.scrollTargetLayout() // Paging
            }
            
            .scrollIndicators(showIndicator)
            .scrollTargetBehavior(.viewAligned) //iOS 17
            
        }.frame(maxWidth: .infinity)
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}

#Preview {
    ContentView()
}
