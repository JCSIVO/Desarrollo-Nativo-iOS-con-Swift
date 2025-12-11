//
//  ViewController.swift
//  who is that pokemon
//
//  Created by Alex Camacho on 01/08/22.
//

import UIKit
import Kingfisher

class PokemonViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet var answerButton: [UIButton]!
    
    lazy var pokemonManager = PokemonManager()
    lazy var imageManager = ImageManager()
    lazy var game = GameModel()

    var random4Pokemons : [PokemonModel] = [] {
        didSet {
            setButtonTitles()
        }
    }
    var correctAnswer: String = ""
    var correctAnswerImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonManager.delegate = self
        imageManager.delegate = self
        
        // print(game.getScore())
        
       // labelScore.text = "Puntaje: 100"
        
        createButtons()
        pokemonManager.fetchPokemon()
        labelMessage.text = " "
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //print(sender)
        let userAnswer = sender.title(for: .normal)!
        
        if game.checkAnswer(userAnswer, correctAnswer) {
            labelMessage.text = "Sí, es un \(userAnswer.capitalized)"
            labelScore.text = "Puntaje: \(game.score)"
            
            sender.layer.borderColor = UIColor.systemGreen.cgColor
            sender.layer.borderWidth = 2
            
            let url = URL(string: correctAnswer)
            pokemonImage.kf.setImage(with: url)
            
            
            // self.pokemonManager.fetchPokemon()
            
            Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { timer in
                self.pokemonManager.fetchPokemon()
                self.labelMessage.text = " "
                sender.layer.borderWidth = 0
            }
            
        } else {
            /*sender.layer.borderColor = UIColor.systemRed.cgColor
            sender.layer.borderWidth = 2
            labelMessage.text = "Nooo, es un \(correctAnswer.capitalized)"
            let url = URL(string: correctAnswer)
            pokemonImage.kf.setImage(with: url)
            // game.setScore(score: 0)
           
            
            Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { timer in
                self.resetGame()
                sender.layer.borderWidth = 0
            }*/
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultaViewController
            destination.pokemonName = correctAnswer
            destination.pokemonImageURL = correctAnswerImage
            destination.finalScore = game.score
            resetGame()
        }
    }
    
    func resetGame() {
        self.pokemonManager.fetchPokemon()
        game.setScore(score: 0)
        labelScore.text = "Puntaje: \(game.score)"
    }
    
    func createButtons() {
        for button in answerButton {
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.layer.shadowOpacity = 1.0
            button.layer.shadowRadius = 0
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = false
        }
    }
    
    func setButtonTitles() {
        for (index, button) in answerButton.enumerated() {
            DispatchQueue.main.async { [self] in
                button.setTitle(random4Pokemons[safe: index]?.name.capitalized, for: .normal)
            }
        }
    }
}

extension PokemonViewController: PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel]) {
        // print(pokemons.choose(4))
        random4Pokemons = pokemons.choose(4)
        
        let index = Int.random(in: 0...3)
        let imageData = random4Pokemons[index].imageUrl
        correctAnswer = random4Pokemons[index].name
        
         imageManager.fetchImage(url: imageData)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension PokemonViewController: ImageManagerDelegate {
    func didUpdateImage(image: ImageModel) {
        correctAnswerImage = image.imageUR
        // print(image.imageUR)
        
        DispatchQueue.main.async {
            let url = URL(string: image.imageUR)
            let effect = ColorControlsProcessor(brightness: -1, contrast: 1, saturation: 1, inputEV: 0)
            //self.pokemonImage.kf.setImage(with: url)
            self.pokemonImage.kf.setImage(
                with: url,
                options: [
                    .processor(effect)
                ]
            )
        }
    }
    
    func didFailWithErrorImage(error: Error) {
        print(error)
    }
    
    
}

extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex ) ? self[index] : nil
    }
}

extension Collection {
    func choose(_ n: Int) -> Array <Element> {
        Array(shuffled().prefix(n))
    }
}
