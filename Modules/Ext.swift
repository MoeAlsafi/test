//
//  Ext.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Foundation
import Foundation
import SwiftyJSON
import SwiftMessages



extension JSON {
    
    func to<T>(type: T?) -> Any? {
        if let baseObj = type as? JSONable.Type {
            if self.type == .array {
                var arrObject: [Any] = []
                for obj in self.arrayValue {
                    let object = baseObj.init(parameter: obj)
                    arrObject.append(object!)
                }
                return arrObject
            } else {
                let object = baseObj.init(parameter: self)
                return object!
            }
        }
        return nil
    }
}
protocol JSONable {
    init?(parameter: JSON)
}
