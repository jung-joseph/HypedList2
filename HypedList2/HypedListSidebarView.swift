//
//  HypedListSidebarView.swift
//  HypedList2iOS
//
//  Created by Joseph Jung on 1/11/21.
//

import SwiftUI

struct HypedListSidebarView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: UpcomingView()) {
                    Label("Upcoming", systemImage: "calendar")
                }
                NavigationLink(destination: DiscoverView()) {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                NavigationLink(destination: PastView()) {
                    Label("Past", systemImage: "gobackward")
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("HypedList")
            .overlay(BottonSidebarView, alignment: .bottom)
            
            
            UpcomingView()
            Text("Select an Event")
        }
    }
    
    var BottonSidebarView: some View {
        VStack{
            Divider()
            Button(action: {
                showingCreateView = true
            }) {
                Label("Create Event", systemImage:
                        "calendar.badge.plus")
            }
            .sheet(isPresented: $showingCreateView) {
                CreateHypedEventView()
            }
        }
    }
}

struct HypedListSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListSidebarView()
    }
}
