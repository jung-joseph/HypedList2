//
//  ContentView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

struct HypedListTabView: View {
    
    init() {
//        UITabBar.appearance().backgroundColor = UIColor.orange
    }
    var body: some View {
        TabView {
            NavigationView {
            UpcomingView()
            }
            
                .tabItem {
                    Image(systemName: "calendar" )
                    Text("Upcoming")
                }
            NavigationView {
            DiscoverView()
            }                .tabItem {
                    Image(systemName: "magnifyingglass" )
                Text("Discover")
                }
            NavigationView {
                PastView()
            }
            .tabItem {
                Image(systemName: "gobackward")
                Text("Past")
            }

        }
//        .accentColor(.blue)
    }
}

struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}
