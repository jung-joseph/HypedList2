//
//  ContentView.swift
//  HypedListWatch Extension
//
//  Created by Joseph Jung on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var data = WatchToPhoneDataController.shared
    
    var body: some View {
        HypedEventWatchListView(hypedEvents: data.hypedEvents)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
