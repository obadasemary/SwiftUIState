//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Abdelrahman Mohamed on 19.08.2020.
//  Copyright © 2020 Abdelrahman Mohamed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    
    @State private var counterBlack = 0
    @State private var counterYellow = 0
    @State private var counterRed = 0
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                // Switch between the play and stop button
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 120))
                    .foregroundColor(isPlaying ? .red : .green)
            }
            
            Text("\(counterBlack + counterYellow + counterRed)")
                .font(.system(size: 220, weight: .bold, design: .rounded))
            
            HStack {
                CounterButton(counter: $counterBlack, color: .black)
                CounterButton(counter: $counterYellow, color: .yellow)
                CounterButton(counter: $counterRed, color: .red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CounterButton: View {
    
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            // increment number
            self.counter += 1
        }) {
            Circle()
                .frame(width: 120, height: 120)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
            )
        }
    }
}
