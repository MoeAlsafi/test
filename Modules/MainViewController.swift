//
//  ViewController.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

let userprovider = MoyaProvider<Users>()

class MainViewController: UITableViewController {
    
    var user = [User]()


//    @IBAction func addNewPersonAction(_ sender: Any) {
//        let vc = UIStoryboard.init(name: "Main", bundle: nil)
//        let addNewPersonViewController = vc.instantiateViewController(withIdentifier: "addPersonViewController")
//        self.present(addNewPersonViewController, animated: true)
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true

        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return user.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
            let user = self.user[indexPath.row]
            cell.textLabel?.text = user.name
            return UITableViewCell()
        }
        

        userprovider.request(.ReadUser) { result in
            switch result {
            case .success(let response):
                let jsonData = try! response.mapJSON()
                let json = JSON(jsonData)
                print(json)
//                if let usersArray = json.to(type: User.self) {
//                    for user in usersArray as! [User] {
//                        self.user.append(user)
//                        self.tableView.reloadData()
//                    }
//                }

            case .failure(let error):
                print(error)
            }
        }
    }
}


        



    
        
        
        
    
        
