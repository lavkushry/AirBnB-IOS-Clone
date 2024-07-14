//
//  ListingView.swift
//  AirBnB
//
//  Created by Lavkush kumar on 12/07/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 4){
            //Images
        ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //Listing Details
            HStack(alignment:.top){
                //Details
                VStack(alignment:.leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 Mile Away")
                        .foregroundStyle(.gray)
                    Text("Nov 2 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing : 4) {
                        Text("$\(listing.pricePerNight) ")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                Spacer()
        
                //Rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)

            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
