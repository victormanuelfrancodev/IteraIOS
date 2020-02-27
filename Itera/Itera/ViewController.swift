//
//  ViewController.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit
import PMAlertController

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.moveTextFieldForKeyBoard()
        passTextField.delegate = self
        userTextField.delegate = self
        // Do any additional setup after loading the view.
        
    }

    @IBAction func loginAction(_ sender: Any) {
        if let password = passTextField.text, let user = userTextField.text{
            if password.isEmpty || user.isEmpty{
                //mostrar aviso
                message(title: "Importante 👮🏻‍♂️", description: "Completa los datos")
            }else{
                //entrar
                if password != "123456" && user != "admin"{
                    message(title: "Importante 👮🏻‍♂️", description: "Usuario y contraseña incorrectos")
                }
            }
        }
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 12
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func message(title:String,description:String){
        let alertVC = PMAlertController(title:title, description: description, image: UIImage(named: "img.png"), style: .alert)

        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                    print("Completa los datos")
                }))


        self.present(alertVC, animated: true, completion: nil)
    }
    
}

