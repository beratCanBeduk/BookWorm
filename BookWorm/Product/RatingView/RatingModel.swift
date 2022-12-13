//
//  RatingModel.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import Foundation
import SwiftUI

struct RatingViewModelData {
    

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
}
