//
//  MainTabView.swift
//  AirBnB
//
//  Created by Lavkush kumar on 13/07/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem {Label("Explore", systemImage: "magnifyingglass") }
            WishListView()
                .tabItem {Label("Wishlists", systemImage: "heart") }

            ProfileView()
                .tabItem {Label("Profile", systemImage: "person") }

        }
    }
}

#Preview {
    MainTabView()
}
