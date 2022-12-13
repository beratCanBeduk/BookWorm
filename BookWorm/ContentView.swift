//
//  ContentView.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students : FetchedResults<Student>
    var body: some View {
        VStack {
            List(students){ student in
                
                Text(student.name ?? "Unknown")
               
            }
            Button("add"){
                let firstNames = ["Berat","Eren" , "Haluk" , "Osman "]
                let secondNames = ["Bedük","Kara","Yel","Aşık"]
                
                let name = firstNames.randomElement()!
                let lastName = secondNames.randomElement()!
                
                let student = Student(context:  moc)
                student.id = UUID()
                student.name = "\(name) \(lastName)"
                
                
                try? moc.save()
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
