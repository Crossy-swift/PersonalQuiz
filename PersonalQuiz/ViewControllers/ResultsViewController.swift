//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var choosenAnswer: [Answer]!
    
    private var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        getResult()
        
    }
}

extension ResultsViewController {
    public func getResult() {
        var animalCount: [AnimalType: Int] = [:]
        let answersType = choosenAnswer.map { $0.type }
        
        for answer in answersType {
        animalCount[answer] = (animalCount[answer] ?? 0) + 1
        }
        
        let topAnswer = animalCount.sorted {
            $0.1 > $1.1
        }.first!.key

        resultLabel.text = "Вы - \(topAnswer.rawValue)!"
        resultDescriptionLabel.text = topAnswer.definition
    }
}
