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

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel])
    func didFailWithError(error: Error)
}

struct PokemonManager {
    let pokemonURL: String = "htpps://pokeapi.co/api/v2/pokemon?limit=898"
    var delegate: PokemonManagerDelegate?
    
    func fetchPokemon(){
        performRequest(with: pokemonURL)
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
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData: safeData){
                        //print(pokemon)
                        self.delegate?.didUpdatePokemon(pokemons: pokemon)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemon = decodeData.results?.map{
                PokemonModel(name: $0.name ?? "", imageUrl: $0.url ?? "")
            }
            return pokemon
        }catch {
            return nil
        }
    }
}
