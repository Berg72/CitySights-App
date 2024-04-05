//
//  ContentView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    @State var selectedBusiness: Business?
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for?", text: $query)
            Button {
                
            } label: {
                Text("Go")
                    .padding(.horizontal)
                    .padding(.vertical, 10.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
            }
        }
        List {
            ForEach(businesses) { b in
                VStack {
                    HStack(spacing: 0) {
                        Image("list-placeholder-image")
                            .padding(.trailing, 16.0)
                            .padding(.bottom, 20.0)
                        VStack(alignment: .leading) {
                            Text(b.name ?? "Resturant")
                                .font(Font.system(size: 15.0))
                                .bold()
                            Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                                .font(Font.system(size: 16.0))
                                .foregroundColor(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(b.rating ?? 0)")
                    }
                    Divider()
                }
                .onTapGesture {
                    selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)

        .task {
            businesses = await service.businessSearch()
        }
        .sheet(item: $selectedBusiness) { item in
            BusinessDetailView(business: item)
        }
    }
}

#Preview {
    ContentView()
}
