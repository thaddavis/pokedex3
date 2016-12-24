//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Thad Duval on 12/23/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = img
        currentEvoImage.image = img
        idLbl.text = "\(pokemon.pokedexId)"

        pokemon.downloadPokemonDetail {
            
            // Whatever we write will only be called after the network call is complete
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        idLbl.text = "\(pokemon.pokedexId)"
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) at LVL \(pokemon.nextEvolutionLevel)"
            
            evoLbl.text = str
            
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
