//
//  File.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Address: Object {
    
    @objc dynamic var street: String = ""
    @objc dynamic var suite: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var zipcode:String = ""

    

    convenience required init (parameter: JSON) {
        self.init()
        self.street = parameter["street"].stringValue
        self.suite = parameter["suite"].stringValue
        self.city = parameter["city"].stringValue
        self.zipcode = parameter["zipcode"].stringValue
        
    }
}
    
    
    
