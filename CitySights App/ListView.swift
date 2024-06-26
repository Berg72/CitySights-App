//
//  ListView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/12/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var model
    var body: some View {
        
        List {
            ForEach(model.businesses) { b in
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
                    model.selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
