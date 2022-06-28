//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Can on 22.06.2022.
//

import SwiftUI


    func newQuestion(tableNum: Int) -> (String, Int) {
    let randomm = Int.random(in: 1..<13)
    
    
        return ("Your question is \(randomm) * \(tableNum)", randomm * tableNum)
    }







struct ContentView: View {
    @State private var tableNumber = 2
    @State private var selectedIndex = "5"
   var numOfQuestions = ["5", "10", "15", "20"]
    
    let chosen = 2
    @State private var multiplier = Int.random(in: 1..<13)
    @State private var question = ""
    @State var showText = false
    @State private var answer: Int?
    @State private var results = 0
    @State private var submitText = ""
    @State private var showResult = false
    
    
    
    var body: some View {
        
        
        VStack {
            Text("Multiplication game")
                .padding()
                .font(.largeTitle)
              
            
            
            
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
            
            
            
        
        
        
        VStack {
            Button("new question") {
               let resulto = newQuestion(tableNum: tableNumber)
                question = resulto.0
                results = resulto.1
                
                
            }
           
               
                    
                    Text(question)
            
                 
            
          
            
          
            
                
            TextField("Your answer", value: $answer, format: .number)
                .padding()
                .keyboardType(.decimalPad)
                .frame(width: 150, alignment: .center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    if results == answer {
                    submitText =  "you got it"
                    } else {
                       submitText =  "try again"
                    }
                    
                    showResult = true
                }
            
            
            
            
            Button("Submit your answer") {
                
                if results == answer {
                submitText =  "you got it"
                } else {
                   submitText =  "try again"
                }
                
                showResult = true
            }  // submit button
            
            if showResult {
                Text(submitText)
            }
        
               
               
           
               
                   
                
            
}
            
        }
        
        
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
