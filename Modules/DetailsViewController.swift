//
//  DetailsViewController.swift
//  testing
//
//  Created by Mohammed Alsafi on 08/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func backAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil)
        let addressViewController = vc.instantiateViewController(withIdentifier: "addressViewController")
        self.present(addressViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
