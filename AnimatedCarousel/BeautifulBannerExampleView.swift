//
//  BeautifulBannerExampleView.swift
//  AnimatedCarousel
//
//  Created by JaeBin on 2023/09/22.
//

import SwiftUI

struct BannerItem: Identifiable {
    let id: UUID = .init()
    let title: String
    let subTitle: String
    let imageURL: String
    
}

struct BeautifulBannerExampleView: View {
    @State var bannerItems: [BannerItem] = [.init(title: "하늘", subTitle: "맑은 하늘을 바라보면 기분이 좋아", imageURL: "https://i.pinimg.com/564x/92/6a/44/926a44c38c195bdabb29bea6bbdc1724.jpg"),
                                            .init(title: "노을", subTitle: "하루의 마무리를 하며 보는 노을이 좋아", imageURL: "https://i.pinimg.com/564x/65/ba/e5/65bae579b362f3277582332a390cca16.jpg"),
                                            .init(title: "밤", subTitle: "밤에는 조금 센치해지는것 같아", imageURL: "https://i.pinimg.com/564x/b5/1a/f6/b51af60378d1eb26b88925d3f604ead0.jpg")]
    var body: some View {
        VStack {
            BeautifulBannerView(data: $bannerItems) { $item in
                VStack(alignment: .trailing)  {
                    Text(item.title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text(item.subTitle)
                }.padding(.horizontal, 20)
                    .shadow(color: .white, radius: 3, x: 0, y: 0)
            } background: { $item in
                AsyncImage(url: item.imageURL.toURL, scale: 1.48).scaledToFill()
            }
            Spacer()
        }


    }
}

#Preview {
    BeautifulBannerExampleView()
}


extension String {
    var toURL: URL? {
        URL(string: self)
    }
}
