//
//  HypedList2iOSWidget.swift
//  HypedList2iOSWidget
//
//  Created by Joseph Jung on 1/4/21.
//

import WidgetKit
import SwiftUI
import Intents
import WidgetKit


struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> HypedEventEntry {
        
        let placeholderHypedEvent = HypedEvent()
        placeholderHypedEvent.color = .green
        placeholderHypedEvent.title = "Loading..."
        return HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: placeholderHypedEvent)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (HypedEventEntry) -> ()) {
        let upcoming = DataController.shared.getUpcomingForWidget()
        
        var entry = HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent1)
        if upcoming.count > 0 {
            entry = HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: upcoming.randomElement())
        }
        completion(entry)
        
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [HypedEventEntry] = []

        let upcoming = DataController.shared.getUpcomingForWidget()

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< upcoming.count {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = HypedEventEntry(date: entryDate, configuration: configuration, hypedEvent: upcoming[hourOffset])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct HypedEventEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hypedEvent: HypedEvent?
}

struct HypedList2iOSWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        GeometryReader { geometry in
            
            if entry.hypedEvent != nil {
                ZStack {
                    if entry.hypedEvent!.image() != nil {
                        entry.hypedEvent!.image()!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height )
                        
                    } else {
                        entry.hypedEvent!.color
                        
                    }
                    Color.black.opacity(0.15)
                    Text(entry.hypedEvent!.title)
                        .foregroundColor(.white)
                        .font(fontSize())
                        .padding()
                        .multilineTextAlignment(.center)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(entry.hypedEvent!.timeFromNow())
                                .bold()
                                .padding( 10)
                                .foregroundColor(.white)
                            
                        }
                    }
                }
            } else {
                VStack {
                    Spacer()
                Text("No events upcoming. Tap me to add something")
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(fontSize())
                    Spacer()
                }
                
            }
        }
    }
    
    func fontSize() -> Font {
        switch widgetFamily {
        case .systemSmall :
            return .title2
        case .systemMedium :
            return .title
        case .systemLarge :
            return .largeTitle
        @unknown default:
            return .body
            
        }
    }
}

@main
struct HypedList2iOSWidget: Widget {
    let kind: String = "HypedList2iOSWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HypedList2iOSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("HypedEvent Widget")
        .description("See Your Upcomming Events!")
    }
}

struct HypedList2iOSWidget_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent1))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: testHypedEvent2))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
            
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            HypedList2iOSWidgetEntryView(entry: HypedEventEntry(date: Date(), configuration: ConfigurationIntent(), hypedEvent: nil))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
