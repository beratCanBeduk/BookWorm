//
//  AddBookView.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel : AddBookVM = AddBookVM()
    @Binding var showingAddScreen : Bool
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $viewModel.data.title)
                    TextField("Author's name", text: $viewModel.data.author)

                    Picker("Genre", selection: $viewModel.data.genre) {
                        ForEach(viewModel.data.genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $viewModel.data.review)
                    RatingView(rating: $viewModel.data.rating)
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                       
                        newBook.id = viewModel.data.id
                        newBook.title = viewModel.data.title
                        newBook.author = viewModel.data.author
                        newBook.rating = Int16(viewModel.data.rating)
                        newBook.genre = viewModel.data.genre
                        newBook.review = viewModel.data.review

                        try? moc.save()
                        showingAddScreen = false
                        dismiss()
                       
                    }
                    
                    
                }
            }
            .navigationTitle("Add Book")
            
        }

    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(showingAddScreen: .constant(true))
    }
}
