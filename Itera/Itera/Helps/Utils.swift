//
//  Utils.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }

    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    func moveTextFieldForKeyBoard() {
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
      }

      @objc func keyboardWillShow(sender: NSNotification) {
          if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
              let keyboardRectangle = keyboardFrame.cgRectValue
              // let keyboardHeight = keyboardRectangle.height
              view.frame.origin.y = -150 // Move view 150 points upward
          }
      }

      @objc func keyboardWillHide(sender _: NSNotification) {
          view.frame.origin.y = 0 // Move view to original position
      }

}
