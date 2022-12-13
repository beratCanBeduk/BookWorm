//
//  HomeView.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @State var showingAddScreen = false
   
    var body: some View {
        NavigationView{
            List{
              
                ForEach(books,id: \.self){book in
                    NavigationLink{
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }//VStack
                        }//HStack
                    }
                    
                }
                .onDelete(perform: removeLanguages(at:))
  
                
            
             
              
            }//List
            
                .navigationTitle("BookWorm")
                .toolbar{
                    Button("Add"){
                        showingAddScreen.toggle()
                    }
            
                    
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView(showingAddScreen: $showingAddScreen)
                }
        }//Navigation View
        
    }//View
    
    func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let selectedBook = books[index]
            moc.delete(selectedBook)
        }
        do {
            try moc.save()
        } catch {
            // handle the Core Data error
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
