//
//  Users.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import RealmSwift
import SwiftyJSON







class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var address: Address? = Address()





    convenience required init (parameter: JSON) {
        self.init()
        self.id = parameter["id"].intValue
        self.name = parameter["name"].stringValue
        self.username = parameter["username"].stringValue
        self.email = parameter["email"].stringValue
        self.address = parameter["address"].to(type: Address.self) as? Address
    }

}
