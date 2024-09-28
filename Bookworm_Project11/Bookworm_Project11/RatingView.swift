//
//  RatingView.swift
//  Bookworm_Project11
//
//  Created by Jesse Sheehan on 9/6/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundColor(number > rating ? offColor : onColor)
                }
//                .accessibilityLabel("\(number == 1 ? "1 Star" : "\(number) Stars")")
//                .accessibilityAddTraits(number > rating ? [] : [.isSelected])
                // THIS IS FINE, BUT WE CAN DO BETTER
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction {direction in
            switch direction {
                case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
        //NOW USER CAN SWIPE UP/DOWN TO INCREMENT THE STARS
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
