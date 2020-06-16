//
//  ContentView.swift
//  ChessTimer
//
//  Created by Xiaochun Shen on 2020/6/16.
//  Copyright © 2020 SXC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80.0)
                
                Image(systemName: timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .frame(width: 180.0, height: 180.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40.0)
                }
                
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0]) min")
                        }
                        
                    }
                .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("Chess Timer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
