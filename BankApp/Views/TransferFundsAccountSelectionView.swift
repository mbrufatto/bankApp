//
//  TransferFundsAccountSelectionView.swift
//  BankApp
//
//  Created by Marcio Habigzang Brufatto on 07/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct TransferFundsAccountSelectionView: View {
    
    @ObservedObject var transferFundsVM: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    var body: some View {
        VStack {
            Button("From \(self.transferFundsVM.fromAccountType)") {
                self.isFromAccount = true
                self.showSheet = true
            }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(Color.white)
            
            Button("To \(self.transferFundsVM.toAccountType)") {
                self.isFromAccount = false
                self.showSheet = true
            }.padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(Color.white)
            .opacity(self.transferFundsVM.fromAccount != nil ? 1.0 : 0.5)
            .disabled(self.transferFundsVM.fromAccount == nil)
            
            TextField("Amount", text: self.$transferFundsVM.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
        }.padding()
        
    }
}
