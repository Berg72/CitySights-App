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
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
