//
//  ContentView.swift
//  ChessTimer
//
//  Created by Xiaochun Shen on 2020/6/16.
//  Copyright © 2020 SXC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedPickerIndex = 0
    
    @ObservedObject var timerManager = TimerManager()
    
    
    
    let availableMinutes = Array(1...59)
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(timerManager.secondsLeft)")
                    .font(.system(size: 80))
                    .padding(.top, 80.0)
                
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .frame(width: 180.0, height: 180.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                    .onTapGesture ( perform: {
                        
                        
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex] * 60)
                            
                        }
                        
                        self.timerManager.timerMode == .running ?
                            self.timerManager.pause() :
                            self.timerManager.start()
                    })
                
                
                
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40.0)
                        .onTapGesture(perform:  {
                            self.timerManager.reset()
                        })
                }
                
                
                
                if timerManager.timerMode == .initial {
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
