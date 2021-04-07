//
//  TransferFundResponse.swift
//  BankApp
//
//  Created by Marcio Habigzang Brufatto on 05/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundResponse: Decodable {
    
    let success: Bool
    let error: String?
}
