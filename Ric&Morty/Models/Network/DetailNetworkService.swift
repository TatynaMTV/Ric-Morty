//
//  DetailNetworkService.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 06.12.2021.
//

import Foundation

class DetailNetworkService {
    func request(urlString: String, completion: @escaping (Result<OneCharacter, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    print("Some erorr")
                    completion(.failure(error!))
                    return
                }
                guard let data = data else { return }
                do {
                    let dataCaracter = try JSONDecoder().decode(OneCharacter.self, from: data)
                    completion(.success(dataCaracter))
                } catch let jsonError {
                    print("Faild to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
