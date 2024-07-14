//
//  WishListView.swift
//  AirBnB
//
//  Created by Lavkush kumar on 13/07/24.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading, spacing: 32){
                
                VStack(alignment:.leading, spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlist once you're logged in")
                        .font(.footnote)
                }
                Button {
                    print("Log in")
                } label: {
                    Text("Log In")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishListView()
}
