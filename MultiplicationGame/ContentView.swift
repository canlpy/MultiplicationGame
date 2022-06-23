//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Can on 22.06.2022.
//

import SwiftUI






struct ContentView: View {
    @State private var tableNumber = 2
    @State private var selectedIndex = "5"
   var numOfQuestions = ["5", "10", "15", "20"]
    
    let chosen = 2
    @State private var multiplier = [1,2,3,4,5,6,7,8,9,10,11,12]
    var questions = [0]
    @State var showText = false
    
    
    
    var body: some View {
        
        
        VStack {
            Text("Multiplication game")
                .padding()
                .font(.largeTitle)
            
            Spacer()
            
            
                Text("Multiplication Table: \(tableNumber)")
                Stepper("\(tableNumber)", value: $tableNumber, in: 2...12)
                .labelsHidden()
                
                
                
            
            
            Text("Number of questions: \(selectedIndex)")
            Picker("Number of games", selection: $selectedIndex) {
                ForEach(numOfQuestions, id: \.self) {
                   Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            
            
            
            
            
            
            
               
        
            Spacer()
            
            Button("new question") {
                showText = true
                
            }
            if showText {
                if let multiplierRandom = multiplier.randomElement() {
                Text("Your question is \(multiplierRandom) * \(tableNumber)")
                }
            }
               
               
                   
                
            Spacer()
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
