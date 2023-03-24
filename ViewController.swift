//
//  ViewController.swift
//  DZ lesson2
//
//  Created by Александр Кузнецов on 21.02.2023.
//
//1. Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран
//2.Создать второй экран Cafe где нужно регистрировать гостя поля для ввода фио и через свитчи была ли предоплата , заказывали ли стол (да или нет )
//3. Поля для ввода номера стола
//4.Добавить третий экран счёт где выводим фио , номер стола и сумма
//5. Добавить кнопку «выставить счёт» расположить на втором экране и по нажатию выкидывать Алерт продолжить да или нет, если нет то убираем Алерт если да то переходим на третий экран
//6.На свое усмотрение добавить свою фичу в приложение которое его улучшит

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var applyButton: UIButton!
    
    let helloLabel = UILabel()
    let login = UITextField()
    let password = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.frame = CGRect(x: 0, y: 0, width:300, height:35)
        helloLabel.center = view.center
        helloLabel.font = UIFont(name: "AmericanTypewriter" , size: 35)
        helloLabel.text = "Sign In"
        helloLabel.textColor = .black
        self.view.addSubview(helloLabel)
        
        login.backgroundColor = .black
        login.text = "Alex"
        login.tintColor = .black
        login.layer.cornerRadius = 5
        login.placeholder = "  login"
        login.textColor = .white
        login.frame = CGRect(x: 57, y: helloLabel.frame.minY + 45, width: 300, height: 35)
        self.view.addSubview(login)
        
        password.backgroundColor = .black
        password.text = "232375"
        password.tintColor = .black
        password.layer.cornerRadius = 5
        password.placeholder = "  password"
        password.textColor = .white
        password.frame = CGRect(x: 57, y: login.frame.minY + 45, width: 300, height: 35)
        self.view.addSubview(password)
        
        applyButton.setTitle("Apply", for: .normal)
        applyButton.tintColor = .white
        applyButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        applyButton.center = view.center
        applyButton.center.y += 200
        applyButton.layer.cornerRadius = 15
        applyButton.backgroundColor = .darkGray
        self.view.addSubview(applyButton)
        
        print("view.x =",view.center.x)
        print("view.y =",view.center.y)
        print(helloLabel.frame)
    }
    //MARK: ToolBar
//    func createToolbar() {
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done",
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(dismissKeyboard))
//        toolbar.setItems([doneButton], animated: true)
//        toolbar.isUserInteractionEnabled = true
//
//        login.inputAccessoryView = toolbar
//        password.inputAccessoryView = toolbar
//
//        // Customization
//        toolbar.tintColor = .white
//        toolbar.barTintColor = .lightGray
//    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func tapScreen(_ sender: Any) {
        view.endEditing(true)
    }
    
// MARK: сдвигание экрана при появлении клавиатуры
//    @objc func updateTextView(notification: Notification) {
//
//        guard
//            let userInfo = notification.userInfo as? [String: Any],
//            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        else { return }
//
//        if notification.name == UIResponder.keyboardWillHideNotification{
//            textView.contentInset = UIEdgeInsets.zero
//        } else {
//            textView.contentInset = UIEdgeInsets(top: 0,
//                                                 left: 0,
//                                                 bottom: keyboardFrame.height - textViewBottomConstraint.constant,
//                                                 right: 0)
//            textView.scrollIndicatorInsets = textView.contentInset
//        }
//
//        textView.scrollRangeToVisible(textView.selectedRange)
//
//    }
    
    @IBAction func applyButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewData") as! ViewData
        
        if login.text == "Alex" || password.text == "232375" {
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alertController = UIAlertController(title: "Atention!", message: "Wrong Login or Password!!!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
    
    
    
    // MARK: Переход всплыващим экраном
//    let storyboard = UIStoryboard(name: "ViewData", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "ViewData") as! ViewData
//    present(vc, animated: true)
    // MARK: Переход с помощью NavigationController
//    navigationController?.pushViewController(vc, animated: true)
    
    
}

