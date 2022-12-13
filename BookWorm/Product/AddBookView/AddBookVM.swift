//
//  AddBookVM.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import Foundation


class AddBookVM : ObservableObject {
 
    @Published var data = AddBookVMS()
}


struct AddBookVMS : Codable , Identifiable {
      var genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
      var id = UUID ()
      var title = ""
      var author = ""
      var rating = 3
      var genre = ""
      var review = ""
}
