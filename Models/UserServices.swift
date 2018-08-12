//
//  UserServices.swift
//  testing
//
//  Created by Mohammed Alsafi on 06/08/2018.
//  Copyright © 2018 Mohammed Alsafi. All rights reserved.
//

import Moya

let url = "https://jsonplaceholder.typicode.com"
enum Users {
    case CrearUser(name: String,username: String, email: String, address: String)
    case ReadUser
    case UpdateUser(id: Int, name: String,username: String, email: String, address: String)
    case DeleteUser(id: Int)
}

extension Users: TargetType {
    
    var baseURL: URL { return URL(string: url)!
    }
    

    
    var method: Method {
        switch self {
        case .CrearUser:  
            return .post
        case .ReadUser:
            return .get
        case .UpdateUser:
            return .put
        case .DeleteUser:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .CrearUser, .ReadUser:
            return "/users"
        case .UpdateUser(let id,_,_,_,_), .DeleteUser(let id):
            return "/users\(id)"
            
        }
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case let .CrearUser( name, username, email, address):
            return .requestParameters(parameters: ["name": name, "username": username, "email": email, "address": address], encoding: JSONEncoding.default)
        case let .UpdateUser(_,name, username, email, address):
            return .requestParameters(parameters: ["name": name, "username": username, "email": email, "address": address], encoding: JSONEncoding.default)
        case .ReadUser, .DeleteUser(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}





