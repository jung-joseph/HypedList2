//
//  HypedList2App.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

@main
struct HypedList2App: App {
    var body: some Scene {
        WindowGroup {
            HypedListTabView()
                .onAppear {
                    DataController.shared.loadData()
                    DataController.shared.getDiscoverEvents()
                }
        }
    }
}
