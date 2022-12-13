//
//  RatingViewModel.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import Foundation
import SwiftUI

class RatingViewModel : ObservableObject{
   
    @Published var data = RatingViewModelData()
    
    
    func image(for number: Int , with rating : Int) -> Image {
        if number > rating {
            return data.offImage ?? data.onImage
        } else {
            return data.onImage
        }
    }
}




