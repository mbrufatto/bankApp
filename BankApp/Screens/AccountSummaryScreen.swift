//
//  AccountSummary.swift
//  BankApp
//
//  Created by Marcio Habigzang Brufatto on 01/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    var body: some View {
        
        
        VStack {
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(accountSummaryVM.total.formatAsCurrency())")
                    
                    Spacer()
                    Button("Transfer Funds") {
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }.padding()
                }
            }
        }
        
        .onAppear {
            self.accountSummaryVM.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            self.accountSummaryVM.getAllAccounts()
        }) {
            if self.activeSheet == .transferFunds {
                TransferFundsScreen()
            } else if self.activeSheet == .addAccount {
                AddAccountScreen()
            }
        }
        .navigationBarItems(trailing: Button("Add Account"){
            self.activeSheet = .addAccount
            self.isPresented = true
        })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummary_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
