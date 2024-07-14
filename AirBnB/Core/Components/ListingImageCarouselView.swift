//
//  ListingImageCarouselView.swift
//  AirBnB
//
//  Created by Lavkush kumar on 13/07/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURL, id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
        }
       .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
