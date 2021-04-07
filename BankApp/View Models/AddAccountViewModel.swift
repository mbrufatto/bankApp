//
//  AddAccountViewModel.swift
//  BankApp
//
//  Created by Marcio Habigzang Brufatto on 05/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class AddAccountViewModel: ObservableObject {
    
    var name: String = ""
    var accountType: AccountType = .checking
    var balance: String = ""
    
    @Published var errorMessage: String = ""
}

extension AddAccountViewModel {
    private var isNameValid: Bool {
        !name.isEmpty
    }
    
    private var isBalanceValid: Bool {
        guard let userBalence = Double(balance) else {
            return false
        }
        
        return userBalence <= 0 ? false : true
    }
    
    private func isValid() -> Bool {
        var errors = [String]()
        
        if !isNameValid {
            errors.append("Name is not valid")
        }
        
        if !isBalanceValid {
            errors.append("Balance is not valid")
        }
        
        if !errors.isEmpty {
            DispatchQueue.main.async {
                self.errorMessage = errors.joined(separator: "\n")
            }
            return false
        }
        
        return true
    }
}

extension AddAccountViewModel {
    
    func createAccount(completion: @escaping(Bool) -> Void) {
        
        if !isValid() {
            return completion(false)
        }
        
        let createAccountReq = CreateAccountRequest(name: name, accountType: accountType.rawValue, balance: Double(balance)!)
        
        AccountService.shared.createAccount(createAccountRequest: createAccountReq) { result in
            switch result {
            case .success(let response):
                if response.success {
                    completion(true)
                } else {
                    if let error = response.error {
                        DispatchQueue.main.async {
                            self.errorMessage = error
                        }
                        
                        completion(false)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
