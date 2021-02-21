//
//  InfoLineView.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 21/02/2021.
//

import SwiftUI

struct InfoLineView: View {

    private var titleString: String
    private var infoValue: String

    init(titleString: String,
         infoValue: String) {
        self.titleString = titleString
        self.infoValue = infoValue
    }
    var body: some View {
        HStack {
            Text(self.titleString)
                .foregroundColor(.gray)
                .font(.footnote)
            Spacer()
            Text(self.infoValue)
                .font(.footnote)
        }
    }
}

struct InfoLineView_Previews: PreviewProvider {
    static var previews: some View {
        InfoLineView(titleString: "title", infoValue: "info")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()

    }
}
