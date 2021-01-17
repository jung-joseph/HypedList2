//
//  MainView.swift
//  HypedList2iOS
//
//  Created by Joseph Jung on 1/11/21.
//

import SwiftUI

struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            HypedListTabView()
            
        } else {
            HypedListSidebarView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
