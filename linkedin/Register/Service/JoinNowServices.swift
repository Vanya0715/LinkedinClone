//
//  JoinNowServices.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 14/07/22.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

//MARK: -  Data fields for registartion

struct RegistrationCredentials {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

//MARK: -
protocol RegistrationService {
    func register(with credentials: RegistrationCredentials) -> AnyPublisher<Void, Error>
}

//MARK: -
enum RegistrationKeys: String {
    case firstName
    case lastName
    case occupation
}

//MARK: - 
final class RegistrationServiceImpl: RegistrationService {
    
    static var storeRoot = Firestore.firestore()
    
    static func getUserId(userid: String) -> DocumentReference {
        return storeRoot.collection("users").document(userid)
    }
    
    func register(with credentials: RegistrationCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {

            Future { promise in
                
                Auth.auth().createUser(withEmail: credentials.email,
                                       password: credentials.password) { res, error in
                    
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        
                        if let uid = res?.user.uid {
                            
                            let values = [RegistrationKeys.firstName.rawValue: credentials.firstName,
                                          RegistrationKeys.lastName.rawValue: credentials.lastName,
                                          RegistrationKeys.occupation.rawValue: credentials.occupation] as [String : Any]
                            
                            Database
                                .database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values) { error, ref in
                                    
                                    if let err = error {
                                        promise(.failure(err))
                                    } else {
                                        promise(.success(()))
                                    }
                                }
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

