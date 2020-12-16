//
//  UpcomingView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        Text("Upcoming!")
            .navigationTitle("Upcoming")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showingCreateView = true
                                    }) {
                                        Image(systemName: "calendar.badge.plus")
                                            .font(.title)
                                    }
                                    .sheet(isPresented: $showingCreateView) {
                                        CreateHypedEventView()
                                    })
            
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
