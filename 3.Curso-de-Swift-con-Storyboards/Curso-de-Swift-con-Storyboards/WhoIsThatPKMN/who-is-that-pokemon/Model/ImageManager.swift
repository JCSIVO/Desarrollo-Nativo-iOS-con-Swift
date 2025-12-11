//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by José Conejero Sivó on 11/11/25.
//

// Pasos para consumir una API
/*
 1. Create/get URL
 2. Create the URLSession
 3. Give the session a task
 4. Start the task
 */

import Foundation

protocol ImageManagerDelegate {
    func didUpdateImage(image: ImageModel)
    func didFailWithErrorImage(error: Error)
}

struct ImageManager {
    // let pokemonURL: String = "htpps://pokeapi.co/api/v2/pokemon?limit=898"
    var delegate: ImageManagerDelegate?
    
    func fetchImage(url: String){
        performRequest(with: url)
    }
    
    private func performRequest(with urlString: String){
        // 1. Create/get URL
        if let url = URL(string: urlString){
            // 2. Create the URLSession
            let session = URLSession(configuration: .default)
            //  3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil  {
                    //print(error!)
                    self.delegate?.didFailWithErrorImage(error: error!)
                }
                if let safeData = data {
                    if let image = self.parseJSON(imageData: safeData){
                        //print(pokemon)
                        self.delegate?.didUpdateImage(image: image)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    private func parseJSON(imageData: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(ImageData.self, from: imageData)
            let image = decodeData.sprites?.other?.officialArtwork?.frontDefault ?? ""
            
            return ImageModel(imageUR: image)
        } catch {
            return nil
        }
    }
}


