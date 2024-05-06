//
//  OnboardingViewDetails.swift
//  CitySights App
//
//  Created by Mark Bergeson on 5/1/24.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var bgColor: Color
    var headLine: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack (spacing: 0.0) {
                
                Spacer()
                Spacer()
                
                Image("onboarding")
                
                Text(headLine)
                    .font(Font.system(size: 22.0))
                    .bold()
                    .padding(.top, 32.0)
                
                Text(subHeadline)
                    .padding(.top, 4.0)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                        buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14.0)
                            .foregroundColor(Color.white)
                            .frame(height: 50.0 )
                        Text("Continue")
                            .bold()
                            .foregroundColor(Color.black)
                            
                    }
                    
                }
                .padding(.bottom, 115.0)
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/25), headLine: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city!") {
        
    }
}
