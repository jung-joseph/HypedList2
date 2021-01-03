//
//  HypedEventListView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/29/20.
//

import SwiftUI

struct HypedEventListView: View {
    
    var hypedEvents: [HypedEvent]
    var noEventsText: String
    var isDiscover = false
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text(noEventsText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                        .padding(.horizontal, 20)
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        NavigationLink( destination: HypedEventDetailView(hypedEvent: hypedEvent, isDiscover: isDiscover)){
                        HypedEventTileView(hypedEvent: hypedEvent)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct HypedEventListView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HypedEventListView(hypedEvents: [testHypedEvent1, testHypedEvent2], noEventsText: "Nothing Here :(")
            
            HypedEventListView(hypedEvents: [], noEventsText: "Nothing Here :(")


        }
    }
}
