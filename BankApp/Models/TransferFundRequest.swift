//
//  TransferFundRequest.swift
//  BankApp
//
//  Created by Marcio Habigzang Brufatto on 05/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
