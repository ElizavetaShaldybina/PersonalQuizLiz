//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var resultWithAnimal: UILabel!
    @IBOutlet weak var resultDefinition: UILabel!
    
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateTheNumberOfAnimals()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }

    private var animals = [Animal: Int]()
    
    func calculateTheNumberOfAnimals() {
        for answer in answerChosen {
            if answer.animal == Animal.dog {
                animals[Animal.dog] = +1
            } else if answer.animal == Animal.cat {
                animals[Animal.cat] = +1
            } else if answer.animal == Animal.rabbit {
                animals[Animal.rabbit] = +1
            } else if answer.animal == Animal.turtle {
                animals[Animal.turtle] = +1
            }
        }
        
        let answersSorted = animals.sorted(by: {(pair1, pair2) in return pair1.value > pair2.value})
        let commonAnswer = answersSorted.first!.key
        
        resultWithAnimal.text = "Вы - \(commonAnswer.rawValue)!"
        resultDefinition.text = commonAnswer.definition
    }
}
