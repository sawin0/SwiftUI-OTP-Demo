//
//  ContentView.swift
//  OTP Demo SwiftUI
//
//  Created by Sabin Ranabhat on 9/23/20.
//  Copyright © 2020 Sabin Ranabhat. All rights reserved.
//

import SwiftUI

let screenSize = UIScreen.main.bounds


struct ContentView: View {
    
    @State private var isPin1FirstResponder: Bool? = true
    @State private var isPin2FirstResponder: Bool? = false
    @State private var isPin3FirstResponder: Bool? = false
    @State private var isPin4FirstResponder: Bool? = false
    
    @State private var token1 = ""
    @State private var token2 = ""
    @State private var token3 = ""
    @State private var token4 = ""
    
    var body: some View {
        VStack {
            
            Text("Enter your otp code")
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
                .foregroundColor(Color.blue)
            .lineLimit(2)
            .font(.largeTitle)
            
            HStack {
                Group {
                    CustomTextField(text: self.$token1,
                                    nextResponder: self.$isPin2FirstResponder,
                                    isResponder: self.$isPin1FirstResponder, previousResponder: .constant(nil))
                    
                    CustomTextField(text: self.$token2,
                                    nextResponder: self.$isPin3FirstResponder,
                                    isResponder: self.$isPin2FirstResponder, previousResponder: self.$isPin1FirstResponder)
                    
                    CustomTextField(text: self.$token3,
                                    nextResponder: self.$isPin4FirstResponder,
                                    isResponder: self.$isPin3FirstResponder, previousResponder: self.$isPin2FirstResponder)
                    
                    CustomTextField(text: self.$token4,
                                    nextResponder: .constant(nil),
                                    isResponder: self.$isPin4FirstResponder, previousResponder: self.$isPin3FirstResponder)
                    
                    
                    
                }
                .frame(width: screenSize.width * 0.15, height: 80)
                .padding(.all, 5)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 2))
                .font(Font.system(size: 40, design: .default))
                .multilineTextAlignment(.center)
            }.padding(.top, 25)
            
            Button(action: {
                let token = "\(self.token1)\(self.token2)\(self.token3)\(self.token4)"
                
                print(token)
            }) {
                Text("Verify")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: screenSize.width - 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2))
            }
            .padding(.top, 25)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
