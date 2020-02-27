//
//  TracingFormViewController.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit
import PMAlertController

class TracingFormViewController: UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var provedores:[String] = ["MVS","ACIR"]
    var movimiento:[String] = ["Solicitud","Reemplazos de material","Cambio de datos","Cancelación"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerProveedor {
            return provedores.count
        } else {
            return movimiento.count
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                     replacementString string: String) -> Bool
      {
          let maxLength = 12
          let currentString: NSString = textField.text! as NSString
          let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= maxLength
      }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerProveedor{
            proveedorTextField.text = provedores[row]
            self.view.endEditing(false)
        }else {
            movimientoTextField.text = movimiento[row]
            self.view.endEditing(false)
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerProveedor {
            return provedores[row]
           } else {
               return movimiento[row]
           }
    }
    @IBOutlet weak var notasTextView: UITextView!
    @IBOutlet weak var fechaInicioTextField: UITextField!
    @IBOutlet weak var folioInternoTextField: UITextField!
    @IBOutlet weak var movimientoTextField: UITextField!
    @IBOutlet weak var clienteTextField: UITextField!
    @IBOutlet weak var proveedorTextField: UITextField!
    @IBOutlet weak var folioTextField: UITextField!
    @IBOutlet weak var aplicarButton: UIButton!
    let pickerMovimientos = UIPickerView()
    let pickerProveedor = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moveTextFieldForKeyBoard()
        self.hideKeyboardWhenTappedAround()
        textFieldsConfig()
        proveedoresPickerConfig()
        movimientosPickerConfig()
        // Do any additional setup after loading the view.
    }
    
    func textFieldsConfig(){
        fechaInicioTextField.delegate = self
        folioInternoTextField.delegate = self
        clienteTextField.delegate = self
        folioTextField.delegate = self
    }
    
    @IBAction func aplicarActionButton(_ sender: Any) {
        if let fechaInicio = fechaInicioTextField.text, let folioInterno = folioTextField.text, let cliente = clienteTextField.text, let folio = folioTextField.text, let proveedor = proveedorTextField.text, let movimiento = movimientoTextField.text{
            if fechaInicio.isEmpty || folioInterno.isEmpty || cliente.isEmpty || folio.isEmpty || proveedor.isEmpty || movimiento.isEmpty{
                 messageFail(title: "Aviso👮🏻‍♂️", description: "Agrega todos los datos")
            }else{
                 message(title: "Aviso", description: "Agregado correctamente")
            }
                
        }
    }
    
    
    func movimientosPickerConfig(){
        
        pickerMovimientos.delegate = self
        pickerMovimientos.dataSource = self
               
                // view.addSubview(pickerProveedor)
        pickerMovimientos.tag = 0
        movimientoTextField.inputView = pickerMovimientos
    }
    
    func proveedoresPickerConfig(){
       
              pickerProveedor.delegate = self
              pickerProveedor.dataSource = self
              // view.addSubview(pickerProveedor)
        pickerProveedor.tag=1
        proveedorTextField.inputView = pickerProveedor
    
    }
    func message(title:String,description:String){
           let alertVC = PMAlertController(title:title, description: description, image: UIImage(named: "img.png"), style: .alert)

           alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                       if let navController = self.navigationController {
                           navController.popViewController(animated: true)
                       }
            
                   }))


           self.present(alertVC, animated: true, completion: nil)
       }
    
    func messageFail(title:String,description:String){
        let alertVC = PMAlertController(title:title, description: description, image: UIImage(named: "img.png"), style: .alert)

        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                 print("ok")
                }))
        self.present(alertVC, animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
