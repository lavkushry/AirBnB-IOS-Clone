//
//  ExploreService.swift
//  AirBnB
//
//  Created by Lavkush kumar on 13/07/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
