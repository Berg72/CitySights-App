//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/5/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        VStack(spacing: 0.0) {
            ZStack(alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72.0, height: 36.0)
                }
            }
            .frame(height: 164.0)
            if let isClosed = business?.isClosed {
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .foregroundStyle(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                
                .frame(height: 36.0)
            }
            
            ScrollView {
                VStack (alignment: .leading, spacing: 0.0) {
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21.0))
                        .bold()
                        .padding(.bottom, 10.0)
                        .padding(.top, 16.0)
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? ""), \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
//                        .padding(.bottom, 10.0)
                    
                    Image("regular_\(business?.rating ?? 0)")
                        .padding(.vertical, 10.0)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12.0)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12.0)

                    Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                    }
                    .padding(.vertical, 12.0)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
