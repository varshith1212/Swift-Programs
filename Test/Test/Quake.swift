//
//  Quake.swift
//  Test
//
//  Created by Sai Varshith on 03/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import Foundation


struct  Quake: Codable {
    
    var type: String
    var features: [Feature]
    
    struct Feature: Codable {
        var id: String
        var type: String
        var properties: Properties
        var geometry: Geometry
        
        struct Properties: Codable {
            var ids: String
            var title: String
        }
        
        struct Geometry: Codable {
            var coordinates: [Double]
        }
    }
}
