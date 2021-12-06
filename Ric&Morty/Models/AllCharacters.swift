//
//  AllCharacters.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//

import Foundation

struct AllCharacters: Decodable {
    var results: [AllResults]
    
}

struct AllResults: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var lastLocation: Location
    var firstLocation: Location
    var image: String
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case name
        case status
        case species
        case gender
        case lastLocation = "origin"
        case firstLocation = "location"
        case image
    }
}

struct Location: Decodable {
    var name: String
}
