//
//  ContentView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            Spacer()
            TextField("What are you looking for?", text: $query)
                .textFieldStyle(.roundedBorder)
                
            
            Button {
                
            } label: {
                Text("Go")
            }
            .foregroundColor(.black)
        }
        .padding()
        .task {
            await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
