//
//  ViewController.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let automata = Automata(ID: 4, Name: "New automata", Occupation: "Exists", Photo: "3.png", RaceID: 1, Race: Race(ID: 400, Name: "Human"))
        //let automataPost = Automata(ID: 0, Name: "New automata", Occupation: "Exists", Photo: "1.png", RaceID: 1, Race: Race())
        //let automataPut = Automata(ID: 32, Name: "New automata x2", Occupation: "Exists x2", Photo: "1.png x2", RaceID: 2, Race: Race())
        //let automataDelete = Automata(ID: 31, Name: "New automata x2", Occupation: "Exists x2", Photo: "1.png x2", RaceID: 2, Race: Race())
        AutomataSession.init().retrieveAutomatas()
        //AutomataSession.init().retrieveOneAutomata(automata: automata)
        //AutomataSession.init().storeAutomata(automata: automataPost)
        //AutomataSession.init().updateAutomata(automata: automataPut)
        //AutomataSession.init().deleteAutomata(automata: automataDelete)
    }

    @IBAction func refresh(_ sender: UIRefreshControl) {
        print("refreshing done!")
        sender.endRefreshing()
    }
    
}

