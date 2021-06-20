//
//  ViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 04.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var phoneOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        passwordTextField.text = ""
        phoneOrEmailTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if phoneOrEmailTextField.text == "admin", passwordTextField.text == "qwerty" {
            print("Auth vsuccess")
        } else {
            print("Auth deny")
        }
    }
    
    private func presentError(with message: String = "Wrong login or password") {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            self.phoneOrEmailTextField.text = ""
            self.passwordTextField.text = ""
        }
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    private func checkUserInfo() -> Bool {
        guard let userName = phoneOrEmailTextField.text,
              let password = passwordTextField.text,
              userName == "",
              password == ""
        else {
            presentError()
            return false
        }
        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "goInside" else { return false }
        
        return checkUserInfo()
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}

