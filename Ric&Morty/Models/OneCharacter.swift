//
//  OneCharacter.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//

import Foundation

struct OneCharacter: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: Locat
    var location: Locat
    var image: String
    var episode: [String]
    
}

struct Locat: Decodable {
    var name: String
}
