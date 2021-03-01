//
//  TappableRocketDetailsView.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import SwiftUI

struct TappableRocketDetailsView: View {

    private let rocket: RocketViewModel

    init(rocket: RocketViewModel) {
        
        self.rocket = rocket

    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            //Top Group
            VStack {
                GroupBox(label: Label(rocket.title ?? "", systemImage: "info.circle"), content: {
                    Divider().padding(.vertical, 4)

                    VStack(alignment: .center, spacing: 10, content: {
                        Image(uiImage: rocket.rocketImageUrl.loadImage())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .cornerRadius(9)
                        Divider().padding(.vertical, 4)
                        Text(rocket.rocketDescription ?? "")
                            .font(.footnote)
                    })
                })

                // MIDDLE GROUP
                GroupBox(label: Label("ROCKET INFO", systemImage: "terminal"), content: {
                    Divider().padding(.vertical, 4)

                    HStack {
                        Text(rocket.active)
                            .font(.footnote)
                        Spacer()
                        Text("Success Rate %\(rocket.successRatePct ?? 0)")
                            .font(.system(size: 12))
                            .fontWeight(.heavy)
                        VStack {
                            Circle()
                                .fill(rocket.badgeColorOutput().1)
                                .frame(width: 10, height: 10, alignment: .trailing)
                        }
                    }
                    InfoLineView(titleString: "Origin Country:", infoValue: rocket.country ?? "")
                    InfoLineView(titleString: "First Flight Date:", infoValue: rocket.firstFlight ?? "")
                    InfoLineView(titleString: "Cost per Launch:", infoValue: "$\(rocket.costPerLaunch ?? 0)")
                })

                // BOTTOM GROUP
                SourceLinkView(wikiString: rocket.wikipediaUrl ?? "")
            }
        })//: ScrollView
        .padding()
    }
}

