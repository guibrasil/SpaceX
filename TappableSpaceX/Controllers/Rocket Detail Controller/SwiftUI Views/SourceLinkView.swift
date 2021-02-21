//
//  SourceLinkView.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 21/02/2021.
//

import SwiftUI

struct SourceLinkView: View {

    let wikiString: String

    init(wikiString: String) {
        self.wikiString = wikiString
    }
    var body: some View {
        GroupBox() {
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: self.wikiString)!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView(wikiString: "www.test.com")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
