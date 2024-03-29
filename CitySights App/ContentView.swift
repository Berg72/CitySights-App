//
//  ContentView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var query = ""
    
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
        .onAppear() {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        }
    }
}

#Preview {
    ContentView()
}
