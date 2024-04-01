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
    var service = DataService()
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                
                
                Button {
                    
                } label: {
                    Text("Go")
                }
                .foregroundColor(.black)
            }
            List (businesses) { b in
                Text(b.name ?? "nil")
            }
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
