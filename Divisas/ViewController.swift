//
//  ViewController.swift
//  Divisas
//
//  Created by alumno on 11/08/16.
//  Copyright © 2016 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTipoCambio: UITextField!
    
    @IBOutlet weak var tfPesos: UITextField!
    
    @IBOutlet weak var tfDolares: UITextField!
    
    @IBOutlet weak var viewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewImage.image = UIImage(named: "imagenDolar")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (quitaTeclado))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Métodos de Acción
    @IBAction func calcular(sender: UIButton) {
        let tipoCambio = Double(tfTipoCambio.text!)
        let pesos = Double(tfPesos.text!)
        
        if tipoCambio != nil && pesos != nil {
            let dolares = pesos! / tipoCambio!
            tfDolares.text! = String(format: "%0.2f", dolares)
        } else {
            let alerta = UIAlertController(title: "Error en los datos", message: "Todos los campos deben tener un valor numérico", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    func quitaTeclado() {
        view.endEditing(true)
    }
}

