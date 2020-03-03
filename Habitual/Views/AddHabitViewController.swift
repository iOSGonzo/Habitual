//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Gonzalo Birrueta on 3/1/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let habitImages = Habit.Images.allCases


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.register(HabitImageCollectionViewCell.nib, forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
        
        setupNavBar()

    }
    
    func setupNavBar() {
        title = "Select Image"

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton

    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {

        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    
    
    
    @IBAction func pickPhotoButtonPressed(_ sender: UIButton) {
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


extension AddHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitImageCollectionViewCell.identifier, for: indexPath) as! HabitImageCollectionViewCell

         cell.setImage(image: habitImages[indexPath.row].image)

         return cell
    }
}