//
//  RatingView.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    @ObservedObject var viewModel = RatingViewModel()
    
    
    var body: some View {
        HStack {
            if viewModel.data.label.isEmpty == false {
                Text(viewModel.data.label)
            }

            ForEach(1..<viewModel.data.maximumRating + 1, id: \.self) { number in
                viewModel.image(for: number , with: rating)
                    .foregroundColor(number > rating ? viewModel.data.offColor : viewModel.data.onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
   
}



struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
