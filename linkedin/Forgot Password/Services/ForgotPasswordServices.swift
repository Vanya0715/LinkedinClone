//
//  ForgotPasswordServices.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 22/07/22.
//

import Foundation
import Firebase
import Combine

protocol ForgotPasswordService {
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error>
}

final class ForgotPasswordServiceImpl: ForgotPasswordService {
    
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error> {
        
        Deferred {
            Future { promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email) { error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}
