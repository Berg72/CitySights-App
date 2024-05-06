//
//  onboardingView.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/29/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack {
            
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/25)
            }
            else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            TabView(selection: $selectedViewIndex) {
                
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/25), headLine: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city!") {
                    
                    withAnimation {
                        selectedViewIndex = 1
                    }
                    
                }
                .ignoresSafeArea()
                .tag(0)
                
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headLine: "Discover your city", subHeadline: "We'll show you the best resturants, venues, and more, based on your location") {
                    
                    dismiss()
                }
                .ignoresSafeArea()
                .tag(1)
                
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack(spacing: 16.0) {
                    Spacer()
                    Circle()
                        .frame(width: 10.0)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10.0)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220.0)
            }
            
        }
            .ignoresSafeArea()
        
    }
}

#Preview {
    OnboardingView()
}
