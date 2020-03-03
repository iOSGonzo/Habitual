//
//  HabitDetailedViewController.swift
//  Habitual
//
//  Created by Gonzalo Birrueta on 3/2/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {

    var habit: Habit!
    var habitIndex: Int!
    
    private var persistence = PersistenceLayer()

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressActionButton(_ sender: UIButton) {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    
    
    private func updateUI() {
          title = habit.title
          imageViewIcon.image = habit.selectedImage.image
          labelCurrentStreak.text = "\(habit.currentStreak) days"
          labelTotalCompletions.text = String(habit.numberOfCompletions)
          labelBestStreak.text = String(habit.bestStreak)
          labelStartingDate.text = habit.dateCreated.stringValue

          if habit.completedToday {
              buttonAction.setTitle("Completed for Today!", for: .normal)
          } else {
              buttonAction.setTitle("Mark as Completed", for: .normal)
          }
      }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
