//
//  ContentView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/28/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    
    @State var query: String = ""
    @FocusState var queryBoxFocused: Bool
    
    @State var showOptions = false
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "resturants"
    
    
    var body: some View {
        
        @Bindable var model = model
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation {
                            showOptions = true
                        }
                    }
                
                Button {
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    // perform a serach
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32.0)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6.0)
                }
            }
            .padding(.horizontal)
            
            if showOptions {
                
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Resturants")
                                .tag("resturants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                
                .padding(.horizontal, 40.0)
                .transition(.push(from: .top))
                
            }
            
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if model.locationAuthStatus == .denied {
                Spacer()
                Text("Please allow location services for this app to see sights near you.")
                    .padding(.horizontal)
                Button {
                    
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                    
                } label: {
                    Text("Open Privacy Settings")
                }

                Spacer()
            }
            else if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
    
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
