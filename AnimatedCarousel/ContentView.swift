//
//  ContentView.swift
//  AnimatedCarousel
//
//  Created by JaeBin on 2023/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var items: [Item] = [.init(color: .red, title: "Red Title",
                                      subTitle: "Breakfast procuring nay end happiness allowance assurance frankness. Met simplicity nor difficulty unreserved who."),
                                .init(color: .blue, title: "Blue Title",
                                      subTitle: "Entreaties mr conviction dissimilar me astonished estimating cultivated. On no applauded exquisite my additions. Pronounce add boy estimable nay suspected."),
                                .init(color: .green, title: "Green Title",
                                      subTitle: "Talking chamber as shewing an it minutes. Trees fully of blind do."),
                                .init(color: .yellow, title: "yellow Title",
                                      subTitle: "Our compass see age uncivil matters weather forbade her minutes. Ready how but truth son new under. ")]
    var body: some View {
        CustomPagingView(data: $items) { $item in
            VStack {
                Text(item.title)
                    .font(.title.bold())
                Text(item.subTitle)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 35)
        } content: { $item in
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(item.color.gradient)
                .frame(width: 150, height: 100)
        }
        .safeAreaPadding([.horizontal, .bottom], 35)

    }
}

#Preview {
    ContentView()
}
