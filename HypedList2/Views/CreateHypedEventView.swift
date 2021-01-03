//
//  CreateHypedEventView.swift
//  HypedList2
//
//  Created by Joseph Jung on 12/16/20.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form{
                
                
                
                
                Section {
                    
                    LabelView(title: "Title", iconImage: "keyboard", backgroundColor: .green)
                    
                    TextField("Family Vacation", text: $hypedEvent.title)
                        .autocapitalization(.words)
                }
                
                Section {
                    
                    
                    LabelView(title: "Date", iconImage: "calendar", backgroundColor: .blue)
                    DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                    Toggle(isOn: $showTime) {
                        LabelView(title: "Time", iconImage: "clock.fill", backgroundColor: .blue)
                    }
                }
                
                Section {
                    if hypedEvent.image() == nil {
                        HStack {
                            LabelView(title: "Image", iconImage: "camera", backgroundColor: .purple)
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Pick Image")
                            }
                            
                        }
                        
                    } else {
                        HStack {
                            LabelView(title: "Image", iconImage: "camera", backgroundColor: .purple)
                            Spacer()
                            Button(action: {
                                hypedEvent.imageData = nil
                            }) {
                                Text("Remove Image")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        
                        Button(action: {
                            showImagePicker = true
                        }) {
                            hypedEvent.image()!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(imageData: $hypedEvent.imageData)
                }
                //            if hypedEvent.imageData != nil {
                //                Image(uiImage: UIImage(data: hypedEvent.imageData!)!)
                //            }
                
                
                Section {
                    
                    ColorPicker(selection: $hypedEvent.color) {
                        LabelView(title: "Color", iconImage: "eyedropper", backgroundColor: .yellow)
                    }
                }
                
                Section {
                    LabelView(title: "Website", iconImage: "link", backgroundColor: .orange)
                    TextField("nintendo.com", text: $hypedEvent.url)
                        .keyboardType(.URL)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .font(.title2)
            }, trailing: Button(action: {
                DataController.shared.saveHypedEvent(hypedEvent: hypedEvent)
                presentationMode.wrappedValue.dismiss()

            }) {
                Text("Done")
                    .font(.title2)
                    .bold()

            })
            .navigationTitle("Create ")
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
