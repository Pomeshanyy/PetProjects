//
//  ViewData.swift
//  DZ lesson2
//
//  Created by Александр Кузнецов on 21.02.2023.
//

import UIKit

class ViewData: UIViewController {
    
    @IBOutlet weak var labelTelefonNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    
    @IBAction func TapViewData(_ sender: Any) {
        dismissKeyboard()
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CheckList") as! CheckList
        
        if labelTelefonNumber.text?.count == 11 {
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alertController = UIAlertController(title: "Atention!", message: "Wrong Telefon Number!\nPlease check this!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
}



