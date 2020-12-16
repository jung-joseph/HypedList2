//
//  LabelView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

struct LabelView: View {
    var title: String
    var iconImage: String
    var backgroundColor: Color
    
    var body: some View {
        Label {
             Text(title)
        } icon: {
            Image(systemName: iconImage)
                .padding(4)
                .background(backgroundColor)
                .cornerRadius(7)
                .foregroundColor(.white)
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView( title: "label title", iconImage: "keyboard", backgroundColor: Color.blue).previewLayout(.sizeThatFits)
    }
}
