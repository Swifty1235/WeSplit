//
//  ContentView.swift
//  WeSplit
//
//  Created by Pedro Romero on 6/6/24.
//

import SwiftUI
struct ContentView: View {
    
    @State private var checkAmmount = 0.0
    @State private var numberPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var ammountisFocused: Bool
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    var perPerson: Double{
        let peopleCount = Double(numberPeople) + 2
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmmount / 100 * tipSelection
        let grandTotal = checkAmmount + tipValue
        let ammountPerson = grandTotal / peopleCount
        return ammountPerson
    }
    
    var totalplusTip : Double{
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmmount / 100 * tipSelection
        return checkAmmount + tipValue
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section ("Ammount"){
                    TextField("Amount", value: $checkAmmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($ammountisFocused)
                    
                    Picker("Number of People" , selection: $numberPeople){
                        ForEach (2..<100){
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                Section("Add Tip?"){
                    Picker("Tip Percentage" , selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                
                    //addition of custom tip
                        TextField("Custom Tip", value: $tipPercentage , format: .percent)
                    
                            .keyboardType(.decimalPad)
                            .pickerStyle(.navigationLink)
                }
                
                Section("Ammount per Person"){
                    Text(perPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total"){
                    Text(totalplusTip,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                .navigationTitle("WeSplit")
                .toolbar{
                    if ammountisFocused{
                        Button("Done") {
                            ammountisFocused = false
                        }
                    }
                }
            }
        }
    }
}




#Preview {
    ContentView()
}




/*
 NavigationStack{
    Form{
        Section{
            Text("Hello World")
        }
        
        Text("Hiii")
        Text("Hello World")
        
        Section{
            Text("More Settings")
            Text("Hello World")
            Text("Hello World")
        }
    }
    .navigationTitle("Hello")
    .navigationBarTitleDisplayMode(.inline)
 
 
 ///////////////////////
 @State private var tapCount = 0
 
 var body: some View {
     Button ("Tap Count = \(tapCount)"){
         tapCount += 1
 
 
 //////////////////////////
 
 //Instead of mutating which is only func. Use @State to modify value
 @State private var name = ""
 
 var body: some View {
     Form{
         TextField("Insert Name" , text: $name)
         Text("Your name is = \(name)")
     }
 }
}
 
 
 struct ContentView: View {
     let students = ["Harry" , "Hermione" , "Ron"]
     @State private var selectedStudent = "Harry"
     
     var body: some View {
         NavigationStack{
             Form{
                 Picker("Select a Student" , selection: $selectedStudent) {
                     ForEach (students, id: \.self){
                         Text($0)
                     }
                 }
             }
             .navigationTitle("Student Selector")
         }
     }
 }
 
 */
