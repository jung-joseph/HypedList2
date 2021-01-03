//
//  DiscoverView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/31/20.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var data = DataController.shared

    var body: some View {
        HypedEventListView(hypedEvents: data.discoverHypedEvents.sorted { $0.date < $1.date}, noEventsText: "Loading some awesome stuff for ya!", isDiscover: true)
            .navigationTitle("Discover")
            .navigationBarItems(trailing:
                                    Button(action: {
                                            data.getDiscoverEvents()                                    }) {
                                        Image(systemName: "arrow.clockwise")
                                            .font(.title)
                                    }
                                
            )
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
