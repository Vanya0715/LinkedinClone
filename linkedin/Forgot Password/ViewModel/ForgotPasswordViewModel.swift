//
//  ForgotPasswordViewModel.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 22/07/22.
//

import Foundation

import Foundation
import Combine

protocol ForgotPasswordViewModel {
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
    func sendPasswordResetRequest()
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    let service: ForgotPasswordService
    @Published var email: String = ""

    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordResetRequest() {
        service
            .sendPasswordResetRequest(to: email)
            .sink { res in
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
            } receiveValue: {
                print("Sending request..")
            }
            .store(in: &subscriptions)
    }
}
