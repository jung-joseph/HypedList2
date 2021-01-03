//
//  HypedEventTileView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

struct HypedEventTileView: View {
    
    @ObservedObject var hypedEvent: HypedEvent
    
    var body: some View {
        VStack(spacing: 0){
            if hypedEvent.image() != nil {
                hypedEvent.image()!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Rectangle().foregroundColor(hypedEvent.color)
                .frame(height: 15)
            HStack {
            Text(hypedEvent.title)
                .font(.title)
                .padding(10)
                
                Spacer()
            }
            .background(Color.white)

            HStack {
                Image(systemName: "calendar")
                Text(hypedEvent.dateAsString())
                Spacer()
                Text(hypedEvent.timeFromNow())
                Image(systemName: "clock.fill")
                    .foregroundColor(.blue)
                 
            }
            .font(.title3)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .background(Color.white)

            
        }
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct HypedEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventTileView(hypedEvent: testHypedEvent1)
    }
}
