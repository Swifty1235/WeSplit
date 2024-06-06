//
//  ContentView.swift
//  WeSplit
//
//  Created by Pedro Romero on 6/6/24.
//

import SwiftUI

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
 
 */
