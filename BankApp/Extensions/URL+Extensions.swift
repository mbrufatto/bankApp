


import Foundation

extension URL {
    
    static func urlForAccounts() -> URL? {
         return URL(string: "https://comet-maize-acrylic.glitch.me/api/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string:
                    "https://comet-maize-acrylic.glitch.me/api/accounts")
    }
    
    static func urlForTransferFunds() -> URL? {
        return URL(string:
                    "https://comet-maize-acrylic.glitch.me/api/transfer")
    }
}
